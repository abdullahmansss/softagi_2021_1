import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:sqflite/sqflite.dart';

class NewTasksScreen extends StatefulWidget {
  @override
  _NewTasksScreenState createState() => _NewTasksScreenState();
}

class _NewTasksScreenState extends State<NewTasksScreen> {
  Database database;
  List<Map> list;

  var titleController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    openDb();
  }

  bool isChecked = false;

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
      body: ConditionalBuilder(
        condition: list != null,
        builder: (context) => ListView.separated(
          itemBuilder: (context, index) => taskItem(list[index]),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: list.length,
        ),
        fallback: (context) => Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  // //{id: 1, title: first task, data: 2021/03/27, status: new}
  // print(list.toString());
  //
  // // [{id: 1, title: first task, data: 2021/03/27, status: new}, {id: 2, title: second task, data: 2021/03/27, status: new}]
  // print(list[0]);
  //
  // print(list[0]['id']);
  // print(list[0]['title']);
  // print(list[0]['data']);
  // print(list[0]['status']);

  Widget taskItem(Map item) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                item['status'],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    item['data'],
                  ),
                ],
              ),
            ),
          ],
        ),
      );

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
        getData(db).then((value)
        {
          setState(() {
            list = value;
          });
        }).catchError((error) {});
      },
    );
  }

  Future<void> insertToDb({
    @required String title,
    @required String date,
  }) async {
    return await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO tasks(title, data, status) VALUES("$title", "$date", "new")');
      print('inserted: $id');
    });
  }

  Future<List<Map>> getData(db) async {
    return await db.rawQuery('SELECT * FROM tasks');
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

  void showBottom(BuildContext context) {
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

                    insertToDb(
                      title: title,
                      date: date,
                    ).then((value)
                    {
                      Navigator.pop(context);

                      getData(database).then((value)
                      {
                        setState(() {
                          list = value;
                        });
                      }).catchError((error) {});
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