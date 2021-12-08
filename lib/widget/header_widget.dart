import 'package:flutter/material.dart';
import 'package:tea_post/constants/constants.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        SizedBox(
          height: height / 10,
        ),
        Text(
          text,
          style: const TextStyle(
              color: appWhite,
              fontSize: orderTextSize,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
