import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return SingleChildScrollView(
      child: Column(
        children: [
          myDivider(),
          mySettingItem(
            whenTap: ()
            {
              print('Account Settings');
            },
            icon: Icons.settings,
            title: 'Account Settings',
          ),
          myDivider(),
          mySettingItem(
            whenTap: ()
            {
              print('Search');
            },
            icon: Icons.search,
            title: 'Search',
          ),
          smallDivider(),
          mySettingItem(
            whenTap: ()
            {
              print('Logout');
            },
            icon: Icons.logout,
            title: 'Logout',
            isVisible: false,
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Padding(
          //     padding: const EdgeInsets.all(
          //       16.0,
          //     ),
          //     child: Row(
          //       children: [
          //         Container(
          //           color: Colors.red,
          //           child: Icon(
          //             Icons.circle_notifications,
          //           ),
          //         ),
          //         SizedBox(
          //           width: 32.0,
          //         ),
          //         Expanded(
          //           child: Container(
          //             color: Colors.green,
          //             child: Text(
          //               'Account Settings',
          //               style: TextStyle(
          //                 fontSize: 16.0,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 16.0,
          //         ),
          //         Container(
          //           color: Colors.amber,
          //           child: Icon(
          //             Icons.keyboard_arrow_right,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget smallDivider() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0,),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );

  // divider
  Widget myDivider() => Container(
        height: 30.0,
        width: double.infinity,
        color: Colors.grey[300],
      );

  // setting item
  Widget mySettingItem({
    @required IconData icon,
    @required String title,
    @required Function whenTap,
    bool isVisible = true,
  }) =>
      ListTile(
        onTap: whenTap,
        leading: Icon(
          icon,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Visibility(
          visible: isVisible,
          child: Icon(
            Icons.keyboard_arrow_right,
          ),
        ),
      );
}
