// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:tea_post/api/order_services/create_order_services.dart';
import 'package:tea_post/controller/logout_controller.dart';
import 'package:tea_post/model/order/create_order_model.dart';
import 'package:tea_post/widget/button_widget.dart';
import 'package:tea_post/constants/constants.dart';
import 'package:tea_post/widget/header_widget.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({Key? key}) : super(key: key);

  @override
  _AddOrderState createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  TextEditingController tableController = TextEditingController();
  TextEditingController orderIdController = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: appBackColor,
              child: HeaderWidget(text: 'Add Order')),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              height: height / 1.4,
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  color: appWhite),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'Enter Counter Number',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: buttonTextsize),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      controller: tableController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Text(
                      'Order ID',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: buttonTextsize),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: orderIdController,
                      decoration: InputDecoration(
                          hintText: '5432', border: OutlineInputBorder()),
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Enter Order Id';
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    ButtonWidget(
                        text: 'Submit',
                        onClicked: () async {
                          if (formkey.currentState!.validate()) {
                            addOrder();
                          }
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  addOrder() async {
    try {
      CreateOrderModel? reponse = await CreateOrderServices()
          .createOrderRequest(orderIdController.text, tableController.text);

      if (reponse!.status == "200") {
        Navigator.pushReplacementNamed(context, "/home");
        final snackBar = SnackBar(
          content: Text('Order is created please wait'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else if (reponse.status == "401") {
        await LogoutController.logout();
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', (Route<dynamic> route) => false);
      }
    } catch (e) {
      // print(e);
      throw e.toString();

    }
  }
}
