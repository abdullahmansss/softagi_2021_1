import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  // variable to set title in app bar
  final String title;

  HomeScreen({
    this.title = 'No Title',
  });

  @override
  Widget build(BuildContext context)
  {
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
        actions:
        [
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
      body: Column(
        children:
        [
          Expanded(
            child: Container(
              color: Colors.red,
              child: Text(
                'Hello World..!',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Text(
                'Hello World..!',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Text(
                'Hello World..!',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 3 + 2 = 5
  // 1 / 5 = .2

  void onSearchClicked()
  {
    print('search clicked');
  }
}