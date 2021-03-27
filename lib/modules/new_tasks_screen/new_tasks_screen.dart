import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class NewTasksScreen extends StatefulWidget {
  @override
  _NewTasksScreenState createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen>
{
  Database database;
  List<Map> list;

  var titleController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    openDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottom(context);
          //insertToDb();
          //updateData();
          //deleteData();
          // try
          // {
          //   String name = await getData();
          //   print(name);
          // } catch(e)
          // {
          //   print(e.toString());
          // }
          //
          // getData().then((value)
          // {
          //   print(value);
          // }).catchError((e)
          // {
          //   print(e.toString());
          // });
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  // String getName()
  // {
  //   return 'Abdullah';
  // }

  // Future
  // async
  // await

  // Instance of 'Future<String>'

  void openDb() async {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, data TEXT, status TEXT)');
        print('database created');
      },
      onOpen: (Database db) {
        print('database opened');
        getData(db);
      },
    );
  }

  Future<void> insertToDb({
    @required String title,
    @required String date,
  }) async
  {
    return await database.transaction((txn) async
    {
      int id = await txn.rawInsert(
          'INSERT INTO tasks(title, data, status) VALUES("$title", "$date", "new")');
      print('inserted: $id');
    });
  }

  void getData(db) async {
    list = await db.rawQuery('SELECT * FROM tasks');

    //{id: 1, title: first task, data: 2021/03/27, status: new}
    print(list.toString());

    // [{id: 1, title: first task, data: 2021/03/27, status: new}, {id: 2, title: second task, data: 2021/03/27, status: new}]
    print(list[0]);

    print(list[0]['id']);
    print(list[0]['title']);
    print(list[0]['data']);
    print(list[0]['status']);
  }

  void updateData() async {
    int count = await database.rawUpdate(
        'UPDATE tasks SET status = ?, title = ? WHERE id = ?',
        ['archived', 'ffffff task', '1']);

    print('database updated $count');
  }

  void deleteData() async {
    int count =
        await database.rawDelete('DELETE FROM tasks WHERE id = ?', ['1']);

    print('database deleted');
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
                  whenPress: ()
                  {
                    String title = titleController.text;
                    String date = dateController.text;

                    if(title.isEmpty || date.isEmpty)
                    {
                      print('please insert a valid data');
                      return;
                    }

                    insertToDb(
                      title: title,
                      date: date,
                    ).then((value)
                    {
                      Navigator.pop(context);
                    });
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