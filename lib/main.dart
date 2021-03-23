import 'package:flutter/material.dart';
import 'package:softagi_2021/modules/bmi_screen/bmi_screen.dart';
import 'package:softagi_2021/modules/contacts_screen/contacts_screen.dart';
import 'package:softagi_2021/modules/home_screen/home_screen.dart';

// main method in app
void main()
{
  // run my app method
  // param is object from Widget class
  runApp(MyApp());
}

// 1. stateless
// 2. stateful

// main class extends widget
class MyApp extends StatelessWidget
{
  // main method of class to build screen UI
  @override
  Widget build(BuildContext context) {
    // material app object wrap all screens
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Jannah',
        primarySwatch: Colors.teal,
      ),
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: BmiScreen(),
      ),
    );
  }
}

// 1. design                50%
// 2. code implementation   50%

// 1. splash screen module.     2 day
// 2. login module.             4 days
// 3. home module ().              12 days
// 4. package details module.   4 days
// 5. profile module.           4 days
// 6. add package module.       6 days
// 7. previous works module.    2 day
// 8. previous packages module. 2 day
// 9. notifications module.     2 day
// 10. search module.           4 days

// total 42 days * 8 hours = 336 hours
// 336 * 200 = 67,200 L.E

// 50% first day
// 25% 21th day
// 25% 42th day

// 1. analysis
// 2. UI & UX
// 3. Back End
// 4. Mobile Design
// 5. Mobile Back End

// stateless
// stateful