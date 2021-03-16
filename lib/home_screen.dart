import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:softagi_2021/main.dart';

class HomeScreen extends StatefulWidget {
  // variable to set title in app bar
  final String title;

  HomeScreen({
    this.title = 'No Title',
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 1. status bar
    // 2. app bar (leading-title-actions)
    // 3. body
    // 4. bottom navigation
    // 5. floating action button
    // 6. drawer

    // text field
    //emailController.text = 'hello';

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                ),
                child: Container(
                  width: 50.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              defaultFormField(
                controller: emailController,
                icon: Icons.email,
                label: 'Email Address',
                type: TextInputType.emailAddress,
                onSubmit: (value)
                {
                  print(value);
                },
                onChange: (value)
                {
                  print(value);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              defaultFormField(
                controller: passwordController,
                icon: Icons.lock_outline,
                label: 'Password',
                type: TextInputType.visiblePassword,
                onSubmit: (value) {
                  print(value);
                },
                onChange: (value) {
                  print(value);
                },
              ),
              SizedBox(
                height: 40.0,
              ),
              defaultButton(
                whenPress: () {},
                text: 'login',
              ),
              defaultButton(
                whenPress: () {},
                text: 'تسجيل حساب جديد',
              ),
              defaultButton(
                whenPress: () {},
                width: 200.0,
                fullWidth: false,
                text: 'login',
              ),
              SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage(
                  LOGO_PATH,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 65

  // reuse of components
  Widget defaultButton({
    @required Function whenPress,
    Color background = Colors.teal,
    @required String text,
    Color textColor = Colors.white,
    bool fullWidth = true,
    double width,
    bool upperCase = true,
  }) =>
      Container(
        width: fullWidth ? double.infinity : width ?? null,
        child: MaterialButton(
          height: 40.0,
          onPressed: whenPress,
          color: background,
          child: Text(
            upperCase ? text.toUpperCase() : text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      );

  Widget defaultFormField({
    @required TextEditingController controller,
    @required TextInputType type,
    @required String label,
    @required IconData icon,
    @required Function onSubmit,
    @required Function onChange,
  }) =>
      TextField(
        controller: controller,
        keyboardType: type,
        onSubmitted: onSubmit,
        onChanged: onChange,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
          prefixIcon: Icon(
            icon,
          ),
        ),
      );
}
