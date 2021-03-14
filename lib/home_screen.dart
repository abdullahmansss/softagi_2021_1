import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // variable to set title in app bar
  final String title;

  HomeScreen({
    this.title = 'No Title',
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
  @override
  void initState() {
    super.initState();

    streamCounter().listen((event) {
      print(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 1. status bar
    // 2. app bar (leading-title-actions)
    // 3. body
    // 4. bottom navigation
    // 5. floating action button
    // 6. drawer

    // text field

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
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
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.email_outlined,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.lock_outline,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: onSearchClicked,
                color: Colors.blue,
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSearchClicked() async {
    // print('Fetching user order...');
    // print('Your order is: ${await fetchUserOrder()}');

    // var value1 = await getRandomValue();
    // print(value1);
    //
    // getRandomValues().listen((value) {
    //   print('1st: $value');
    // });

    if (counter == 10)
    {
      controller.close(); // Ask stream to shut down and tell listeners.
    } else
      {
        counter++;
        controller.add(counter);
      }
  }

  Future<String> fetchUserOrder() {
    return Future.delayed(
      Duration(seconds: 2),
      () {
        return 'Large Latte';
      },
    );
  }

  Future<int> getRandomValue() async {
    var random = Random(2);
    await Future.delayed(Duration(seconds: 1));
    return random.nextInt(5);
  }

  Stream<int> getRandomValues() async* {
    var random = Random(2);
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield random.nextInt(5);
    }
  }

  StreamController<int> controller;

  int counter = 0;

  Stream<int> streamCounter()
  {
    void startStream()
    {
      print('start');
    }

    void stopStream()
    {
      print('stop');
    }

    controller = StreamController<int>(
      onListen: startStream,
      onPause: stopStream,
      onResume: startStream,
      onCancel: stopStream,
    );

    return controller.stream;
  }
}