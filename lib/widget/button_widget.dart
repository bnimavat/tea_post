// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tea_post/constants/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onClicked,
      child: Container(
        padding: EdgeInsets.all(15),
        width: width,
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: appWhite,
                fontSize: buttonTextsize,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
