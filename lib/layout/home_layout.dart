import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/cubit/cubit.dart';
import 'package:softagi_2021/layout/cubit/states.dart';

class HomeLayout extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Builder(
      builder: (BuildContext context)
      {
        TodoCubit.get(context).openDb();

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
      },
    );
  }
}


// base url : https://newsapi.org/
// url : v2/everything
// queries : ?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca


// https://newsapi.org/
// v2/top-headlines
// ?country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca