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
      body: Container(
        //color: Colors.indigo,
        width: double.infinity,
        //height: double.infinity,
        child: Scrollbar(
          //thickness: 30.0,
          child: SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              //mainAxisSize: MainAxisSize.min,
              children:
              [
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.red,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.yellow,
                  ),
                ),
                Text(
                  'Hello World..!',
                  style: TextStyle(
                    fontSize: 25.0,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
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