import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/cubit/cubit.dart';
import 'package:softagi_2021/layout/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class DoneTasksScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var list = TodoCubit.get(context).doneTasks;

        return Scaffold(
          body: tasksBuilder(list),
        );
      },
    );
  }
}