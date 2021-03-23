import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softagi_2021/modules/bmi_result_screen/bmi_result_screen.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:softagi_2021/shared/styles/styles.dart';

class BmiScreen extends StatefulWidget
{
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
{
  bool isMale;
  double height = 150;
  int age = 25;
  int weight = 80;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: genderCard(
                      tap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      color:
                          isMale != null && isMale ? Colors.teal : Colors.grey,
                      icon: Icons.ac_unit,
                      text: 'Male',
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: genderCard(
                      tap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      color:
                          isMale != null && !isMale ? Colors.teal : Colors.grey,
                      icon: Icons.account_circle,
                      text: 'Female',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height'.toUpperCase(),
                      style: black25(),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      max: 220.0,
                      min: 100.0,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                          print(value.round());
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: personCard(
                      add: () {
                        setState(() {
                          age++;
                        });
                      },
                      minus: () {
                        setState(() {
                          age--;
                        });
                      },
                      text: 'Age',
                      value: age,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: personCard(
                      add: () {
                        setState(() {
                          weight++;
                        });
                      },
                      minus: () {
                        setState(() {
                          weight--;
                        });
                      },
                      text: 'Weight',
                      value: weight,
                    ),
                  ),
                ],
              ),
            ),
          ),
          defaultButton(
            whenPress: ()
            {
              var result = weight / pow(height / 100, 2);
              print(result.round());

              navigateTo(
                context: context,
                widget: BmiResultScreen(
                  age: age,
                  isMale: isMale,
                  result: result.round(),
                ),
              );
            },
            text: 'calculate',
          ),
        ],
      ),
    );
  }
}