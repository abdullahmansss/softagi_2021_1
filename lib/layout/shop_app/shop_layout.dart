import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/shop_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/shop_app/cubit/states.dart';

class ShopLayout extends StatefulWidget
{
  @override
  _ShopLayoutState createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout>
{
  @override
  void initState()
  {
    super.initState();

    ShopCubit.get(context).getHomeData();
    ShopCubit.get(context).getCategoriesData();
    ShopCubit.get(context).getFavoritesData();
    ShopCubit.get(context).getProfileData();
  }

  @override
  Widget build(BuildContext context)
  {
    return Builder(
      builder: (BuildContext context)
      {
        return BlocConsumer<ShopCubit, ShopStates>(
           listener: (context, state) {},
           builder: (context, state)
           {
             return Scaffold(
               appBar: AppBar(
                 title: Text(
                   ShopCubit.get(context).titles[ShopCubit.get(context).currentIndex],
                 ),
               ),
               body: ShopCubit.get(context).screens[ShopCubit.get(context).currentIndex],
               bottomNavigationBar: BottomNavigationBar(
                 type: BottomNavigationBarType.fixed,
                 currentIndex: ShopCubit.get(context).currentIndex,
                 onTap: (index)
                 {
                   ShopCubit.get(context).changeIndex(index);
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
                       Icons.grid_view,
                     ),
                     label: 'Categories',
                   ),
                   BottomNavigationBarItem(
                     icon: Icon(
                       Icons.favorite,
                     ),
                     label: 'Favorites',
                   ),
                   BottomNavigationBarItem(
                     icon: Icon(
                       Icons.settings,
                     ),
                     label: 'Account',
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