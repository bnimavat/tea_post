// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tea_post/constants/constants.dart';

class FakeListView extends StatelessWidget {
  const FakeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (conetxt, index) {
          return Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CircleAvatar(
                    backgroundColor: orderContainerColor,
                    child: Text(''),
                    radius: 30,
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.all(20),
                      color: orderContainerColor,
                      child: Text(''),
                    ),
                  ),
                ],
              ),
              Divider()
            ],
          );
        });
  }
}
