import 'package:flutter/material.dart';

class DoneTasksScreen extends StatefulWidget
{
  @override
  _DoneTasksScreenState createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text(
        'Done Tasks',
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    );
  }
}
