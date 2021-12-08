// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tea_post/pages/create_order.dart';

class AddImageWidget extends StatelessWidget {
  const AddImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      top: height / 5.1,
      left: width / 1.4,
      child: SizedBox(
        width: width / 6,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddOrder()));
          },
          child: const Image(
            image: AssetImage('assets/images/add_icon.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
