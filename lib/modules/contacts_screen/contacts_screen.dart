import 'package:flutter/material.dart';
import 'package:softagi_2021/shared/components/components.dart';

class ContactsModel
{
  final String code;
  final String name;
  final String number;

  ContactsModel({
    this.code,
    this.name,
    this.number,
  });
}

class ContactsScreen extends StatelessWidget
{
  List<ContactsModel> contactsList =
  [
    ContactsModel(
      code: 'A',
      number: '8941365',
      name: 'Ahmed Ali',
    ),//0
    ContactsModel(
      code: 'D',
      number: '01820',
      name: 'Delman Ali',
    ),//1
    ContactsModel(
      code: 'L',
      number: '9643575',
      name: 'Loqman',
    ),//2
    ContactsModel(
      code: 'Y',
      number: '79648',
      name: 'Youssef',
    ),//3
    ContactsModel(
      code: 'A',
      number: '8941365',
      name: 'Ahmed Ali',
    ),//4
    ContactsModel(
      code: 'D',
      number: '01820',
      name: 'Delman Ali',
    ),//5
    ContactsModel(
      code: 'L',
      number: '9643575',
      name: 'Loqman',
    ),//6
    ContactsModel(
      code: 'Y',
      number: '79648',
      name: 'Youssef',
    ),//7
    ContactsModel(
      code: 'A',
      number: '8941365',
      name: 'Ahmed Ali',
    ),//8
    ContactsModel(
      code: 'D',
      number: '01820',
      name: 'Delman Ali',
    ),//9
    ContactsModel(
      code: 'L',
      number: '9643575',
      name: 'Loqman',
    ),//10
    ContactsModel(
      code: 'Y',
      number: '79648',
      name: 'Youssef',
    ),//11
  ];

  @override
  Widget build(BuildContext contactsContext)
  {
    var w = MediaQuery.of(contactsContext).size.width;
    print(w.round());

    var h = MediaQuery.of(contactsContext).size.height;
    print(h.round());

    return w < 300 ? myList() : webList();
  }

  Widget myList()=> Scaffold(
    appBar: AppBar(
      title: Text(
        'Contacts',
      ),
    ),
    body: ListView.separated(
      itemBuilder: (BuildContext listContext, int index)
      {
        return contactItem(
          model: contactsList[index],
        );
      },
      separatorBuilder: (BuildContext listContext, int index) => myDivider(),
      itemCount: contactsList.length,
    ),
  );

  Widget webList()=> Scaffold(
    appBar: AppBar(
      title: Text(
        'Contacts',
      ),
    ),
    body: ListView.separated(
      itemBuilder: (BuildContext listContext, int index)
      {
        return contactItem2(
          model: contactsList[index],
        );
      },
      separatorBuilder: (BuildContext listContext, int index) => myDivider(),
      itemCount: contactsList.length,
    ),
  );
}

// 1. item design.
// 2. create list view.
// 3. create list.
// 4. show items in list view.