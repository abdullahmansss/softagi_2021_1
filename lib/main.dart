import 'package:flutter/material.dart';
import 'package:softagi_2021/home_screen.dart';

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
  Widget build(BuildContext context)
  {
    // material app object wrap all screens
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(
      ),
    );
  }
}
