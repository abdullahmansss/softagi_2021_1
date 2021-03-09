import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
            onPressed: () {
              print('notifications clicked');
            },
            icon: Icon(
              Icons.notifications,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.indigo,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
            end: 20.0,
            top: 20.0,
            bottom: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                [
                  // SizedBox(
                  //   width: 20.0,
                  // ),
                  Container(
                    color: Colors.red,
                    child: Text(
                      'Active',
                    ),
                  ),
                  // Spacer(),
                  MaterialButton(
                    color: Colors.green,
                    onPressed: () {},
                    child: Text(
                      'Watch All',
                    ),
                  ),
                  // SizedBox(
                  //   width: 20.0,
                  // ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    Container(
                      color: Colors.amber,
                      child: Column(
                        children:
                        [
                          Image(
                            image: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                            width: 60.0,
                            height: 60.0,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.blue,
                            child: Row(
                              children:
                              [
                                Icon(
                                  Icons.add_circle_outlined,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Ahmed Ali',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      color: Colors.amber,
                      child: Column(
                        children:
                        [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.blue,
                            child: Row(
                              children:
                              [
                                Icon(
                                  Icons.add_circle_outlined,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Ahmed Ali',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      color: Colors.amber,
                      child: Column(
                        children:
                        [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.blue,
                            child: Row(
                              children:
                              [
                                Icon(
                                  Icons.add_circle_outlined,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Ahmed Ali',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      color: Colors.amber,
                      child: Column(
                        children:
                        [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.blue,
                            child: Row(
                              children:
                              [
                                Icon(
                                  Icons.add_circle_outlined,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Ahmed Ali',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      color: Colors.amber,
                      child: Column(
                        children:
                        [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.blue,
                            child: Row(
                              children:
                              [
                                Icon(
                                  Icons.add_circle_outlined,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Ahmed Ali',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Container(
                      color: Colors.amber,
                      child: Column(
                        children:
                        [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            color: Colors.blue,
                            child: Row(
                              children:
                              [
                                Icon(
                                  Icons.add_circle_outlined,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  'Ahmed Ali',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
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

  void onSearchClicked() {
    print('search clicked');
  }
}
