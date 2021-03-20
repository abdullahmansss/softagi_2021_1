import 'package:flutter/material.dart';
import 'package:softagi_2021/shared/components/components.dart';

class CounterScreen extends StatefulWidget
{
  @override
  CounterScreenState createState() => CounterScreenState();
}

// states
class CounterScreenState extends State<CounterScreen>
{
  int counter;
  List<int> numbers = [];

  @override
  void initState()
  {
    super.initState();
    counter = 5;
    numbers.add(5);
    numbers.add(4);
    numbers.add(3);
    numbers.add(2);
  }

  @override
  Widget build(BuildContext context)
  {
    //int counter = 5;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.0,
              child: defaultButton(
                whenPress: ()
                {
                  setState(()
                  {
                    counter--;
                    print(counter);
                  });
                },
                text: 'minus',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Text(
                '$counter',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Container(
              width: 120.0,
              child: defaultButton(
                whenPress: ()
                {
                  setState(()
                  {
                    counter++;
                    print(counter);
                  });
                },
                text: 'plus',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// counter screen

// initial state
// counter state
// login state