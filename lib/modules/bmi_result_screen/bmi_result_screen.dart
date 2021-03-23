import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:softagi_2021/shared/styles/styles.dart';

class BmiResultScreen extends StatefulWidget {
  final int result;
  final int age;
  final bool isMale;

  const BmiResultScreen({
    @required this.result,
    @required this.age,
    @required this.isMale,
  });

  @override
  _BmiResultScreenState createState() => _BmiResultScreenState();
}

class _BmiResultScreenState extends State<BmiResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator Result',
        ),
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.account_circle,
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            widget.result.toString(),
            style: black25(),
          ),
          Text(
            widget.isMale.toString(),
            style: black25(),
          ),
          Text(
            widget.age.toString(),
            style: black25(),
          ),
        ],
      ),
    );
  }
}
