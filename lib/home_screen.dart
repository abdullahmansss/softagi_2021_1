import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  // variable to set title in app bar
  final String title;

  HomeScreen({
    this.title = 'No Title',
  });

  @override
  Widget build(BuildContext context) {
    // 1. status bar
    // 2. app bar (leading-title-actions)
    // 3. body
    // 4. bottom navigation
    // 5. floating action button
    // 6. drawer

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          title,
          style: TextStyle(),
        ),
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            onPressed: onSearchClicked,
            icon: Icon(
              Icons.search,
            ),
          ),
          IconButton(
            onPressed: ()
            {
              print('notifications clicked');
            },
            icon: Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
    );
  }

  void onSearchClicked()
  {
    print('search clicked');
  }
}