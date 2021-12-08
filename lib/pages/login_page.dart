// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tea_post/api/user_services/login_services.dart';


import 'package:tea_post/constants/constants.dart';
import 'package:tea_post/controller/logout_controller.dart';
import 'package:tea_post/model/user/login_model.dart';

import 'package:tea_post/widget/button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: height,
        width: width,
        color: appBackColor,
        child: Form(
          key: formkey,
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Image(image: AssetImage('assets/images/tea_post_logo.png')),
              Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width / 8,
                    color: Color(0xff333333),
                  ),
                ),
              ),
              SizedBox(
                height: height / 12,
              ),
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Phone Number',
                    filled: true,
                    fillColor: appWhite),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Phone Number";
                  } else if (val.length != 10) {
                    return "Enter Correct Phone Number";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password', filled: true, fillColor: appWhite),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter Password";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ButtonWidget(
                  text: 'Login',
                  onClicked: () async {
                    if (formkey.currentState!.validate()) {
                      login();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  login() async {
    try {
      LoginResponseModel? reponse = await LoginService()
          .loginRequest("0", passController.text, phoneController.text);

      if (reponse!.status == "200") {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        //  prefs.setString('phone', phoneController.text);
        prefs.setString('token', reponse.data!.token.toString());
        // print(reponse!.data!.token);
        Navigator.pushReplacementNamed(context, "/home");
      } else if (reponse.status == "401") {
        await LogoutController.logout();
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', (Route<dynamic> route) => false);
      } else {
        final snackBar = SnackBar(
          content: Text('Please enter correct PhoneNo or Password'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } catch (e) {
      // print(e);
      // throw e.toString();

    }
  }
}
