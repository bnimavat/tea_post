// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea_post/api/order_services/complete_order_services.dart';
import 'package:tea_post/constants/constants.dart';
import 'package:tea_post/controller/logout_controller.dart';
import 'package:tea_post/model/order/complete_order.dart';

import 'package:tea_post/provider/dashboard_provider.dart';

import 'package:tea_post/widget/add_image_widget.dart';
import 'package:tea_post/widget/fake_listview.dart';
import 'package:tea_post/widget/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final dashboardModel =
        Provider.of<DashboardProvider>(context, listen: false);
    dashboardModel.getDashboardOrderList(context);
    // final logoutModel = Provider.of<LogoutProvider>(context, listen: false);
    // logoutModel.logout(context);
    checkdata();
  }

  checkdata() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.getString('token');
    // print('-----------home page initste-----------');
    // print(obtainedphone);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final dashboardModel = Provider.of<DashboardProvider>(context);
    // final logoutProvider = Provider.of<LogoutProvider>(context);

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Stack(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: width,
                height: height / 3,
                color: appBackColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeaderWidget(text: 'Orders'),
                    InkWell(
                      onTap: () async {
                        await LogoutController.logout();
                        // logoutProvider.loading
                        //     ? Center(child: CircularProgressIndicator())
                        //     : ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(
                        //           content:
                        //               Text(logoutProvider.logoutModel!.message),
                        //         ),
                        //       );
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (Route<dynamic> route) => false);
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color: appWhite, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: height / 1.4,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: appWhite),
                  child: dashboardModel.loading
                      ? FakeListView()
                      : ListView.builder(
                          itemCount:
                              dashboardModel.dashboardOrderModel!.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    dashboardModel.dashboardOrderModel!
                                                .data[index].tableId !=
                                            ""
                                        ? CircleAvatar(
                                            child: Text(dashboardModel
                                                .dashboardOrderModel!
                                                .data[index]
                                                .tableId),
                                            radius: 30,
                                          )
                                        : SizedBox(),
                                    dashboardModel.dashboardOrderModel!
                                                .data[index].tableId !=
                                            ""
                                        ? Container(
                                            padding: EdgeInsets.all(20),
                                            color: orderContainerColor,
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text('Order Number'),
                                                Text(dashboardModel
                                                    .dashboardOrderModel!
                                                    .data[index]
                                                    .customOrderId),
                                              ],
                                            ),
                                          )
                                        : Container(
                                            padding: EdgeInsets.all(20),
                                            width: width / 1.5,
                                            color: orderContainerColor,
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Text('Order Number'),
                                                Text(dashboardModel
                                                    .dashboardOrderModel!
                                                    .data[index]
                                                    .customOrderId),
                                              ],
                                            ),
                                          ),
                                    IconButton(
                                      onPressed: () async {
                                        try {
                                          CompleteOrderModel? reponse =
                                              await CompleteOrderService()
                                                  .completeOrderRequest(
                                                      dashboardModel
                                                          .dashboardOrderModel!
                                                          .data[index]
                                                          .id);

                                          if (reponse!.status == "200") {
                                            setState(() {
                                              dashboardModel
                                                  .dashboardOrderModel!.data
                                                  .removeAt(index);
                                            });
                                            final snackBar = SnackBar(
                                              content: Text(
                                                  'Order Number - ${dashboardModel.dashboardOrderModel!.data[index].customOrderId} is completed'),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          } else if (reponse.status == "401") {
                                            await LogoutController.logout();
                                            Navigator.pushNamedAndRemoveUntil(
                                                context,
                                                '/login',
                                                (Route<dynamic> route) =>
                                                    false);
                                          }
                                        } catch (e) {
                                          // print(e);
                                          // throw e.toString();

                                        }
                                      },
                                      icon: Icon(
                                        Icons.check_circle_outline,
                                        color: greenColor,
                                      ),
                                    )
                                  ],
                                ),
                                Divider(),
                              ],
                            );
                          },
                        ),
                ),
              )
            ],
          ),
          AddImageWidget(),
        ],
      )),
    );
  }
}
