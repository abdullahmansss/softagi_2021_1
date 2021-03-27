import 'package:flutter/material.dart';

class ArchivedTasksScreen extends StatefulWidget
{
  @override
  _ArchivedTasksScreenState createState() => _ArchivedTasksScreenState();
}

class _ArchivedTasksScreenState extends State<ArchivedTasksScreen> {
  @override
  Widget build(BuildContext context)
  {
    return Center(
      child: Text(
        'Archived Tasks',
        style: TextStyle(
          fontSize: 25.0,
        ),
      ),
    );
  }
}
