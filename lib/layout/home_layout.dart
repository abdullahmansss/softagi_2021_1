import 'package:flutter/material.dart';
import 'package:softagi_2021/modules/archived_tasks_screen/archived_tasks_screen.dart';
import 'package:softagi_2021/modules/done_tasks_screen/done_tasks_screen.dart';
import 'package:softagi_2021/modules/new_tasks_screen/new_tasks_screen.dart';
import 'package:softagi_2021/modules/settings_screen/setting_screen.dart';

class HomeLayout extends StatefulWidget
{
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
{
  int currentIndex = 0;

  List<Widget> myWidgets =
  [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo',
        ),
      ),
      body: myWidgets[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index)
        {
          setState(()
          {
            print(index);
            currentIndex = index;
          });
        },
        items:
        [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.check_circle,
            ),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive,
            ),
            label: 'Archived',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
