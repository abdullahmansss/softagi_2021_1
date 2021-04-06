import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softagi_2021/layout/cubit/cubit.dart';
import 'package:softagi_2021/layout/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class NewTasksScreen extends StatelessWidget
{
  var titleController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state)
      {
        if(state is TodoInsertDatabaseSuccessState)
        {
          Navigator.pop(context);
        }
      },
      builder: (context, state)
      {
        var list = TodoCubit.get(context).newTasks;

        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: ()
            {
              showBottom(context);
            },
            child: Icon(
              Icons.add,
            ),
          ),
          body: tasksBuilder(list),
        );
      },
    );
  }

  void showBottom(BuildContext context)
  {
    showBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.grey[100],
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                defaultFormField(
                  controller: titleController,
                  type: TextInputType.text,
                  label: 'Task Title',
                  icon: Icons.title,
                  onSubmit: (String value) {},
                  onChange: (String char) {},
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultFormField(
                  controller: dateController,
                  type: TextInputType.datetime,
                  label: 'Task Date',
                  icon: Icons.date_range,
                  onSubmit: (String value) {},
                  onChange: (String char) {},
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultButton(
                  text: 'add',
                  whenPress: () {
                    String title = titleController.text;
                    String date = dateController.text;

                    if (title.isEmpty || date.isEmpty) {
                      // warning - success - error

                      Fluttertoast.showToast(
                        msg: 'please insert a valid data',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.amber,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );

                      return;
                    }

                    TodoCubit.get(context).insertToDb(
                      title: title,
                      date: date,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}