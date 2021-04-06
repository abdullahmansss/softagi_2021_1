import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/cubit/cubit.dart';
import 'package:softagi_2021/layout/cubit/states.dart';

class HomeLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state)
      {

      },
      builder: (context, state)
      {
        var cubit = TodoCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Todo',
            ),
          ),
          body: cubit.myWidgets[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (int index)
            {
              cubit.changeBottom(index);
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
            ],
          ),
        );
      },
    );
  }
}