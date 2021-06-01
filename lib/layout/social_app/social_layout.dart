import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/social_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/social_app/cubit/states.dart';

class SocialLayout extends StatefulWidget {
  @override
  _SocialLayoutState createState() => _SocialLayoutState();
}

class _SocialLayoutState extends State<SocialLayout>
{
  @override
  void initState()
  {
    super.initState();
    SocialCubit.get(context).getProfile();
    SocialCubit.get(context).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(),
          body: SocialCubit.get(context).screens[SocialCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (int index) {
              SocialCubit.get(context).changeIndex(index);
            },
            currentIndex: SocialCubit.get(context).currentIndex,
            items:
            [
              BottomNavigationBarItem(
                label: 'Home',
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(
                  Icons.settings,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
