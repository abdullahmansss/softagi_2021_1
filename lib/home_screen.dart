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
      body: Center(
        child: Container(
          color: Colors.indigo,
          //width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children:
            [
              Text(
                'Hello World..!',
                style: TextStyle(
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
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