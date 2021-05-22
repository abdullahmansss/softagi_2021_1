import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/shop_app/cubit/states.dart';
import 'package:softagi_2021/models/shop_app/categories_model.dart';
import 'package:softagi_2021/models/shop_app/favorites_model.dart';
import 'package:softagi_2021/models/shop_app/home_model.dart';
import 'package:softagi_2021/models/shop_app/simple_model.dart';
import 'package:softagi_2021/modules/shop_app/shop_account/shop_account_screen.dart';
import 'package:softagi_2021/modules/shop_app/shop_categories/shop_categories_screen.dart';
import 'package:softagi_2021/modules/shop_app/shop_favorites/shop_favorites_screen.dart';
import 'package:softagi_2021/modules/shop_app/shop_home/shop_home_screen.dart';
import 'package:softagi_2021/shared/constants.dart';
import 'package:softagi_2021/shared/network/end_points.dart';
import 'package:softagi_2021/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens =
  [
    ShopHomeScreen(),
    ShopCategoriesScreen(),
    ShopFavoritesScreen(),
    ShopAccountScreen(),
  ];

  List<String> titles = [
    'Home',
    'Categories',
    'Favorites',
    'Account',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;
  Map<int, bool> favorites = {};

  void getHomeData()
  {
    DioHelper.getData(
      url: HOME,
      token: userModel.data.token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);

      homeModel.data.products.forEach((element)
      {
        favorites.addAll({
          element.id : element.inFavorite,
        });
      });

      emit(ShopGetHomeSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopGetHomeErrorState());
    });
  }

  CategoriesModel categoriesModel;

  void getCategoriesData()
  {
    DioHelper.getData(
      url: CATEGORIES,
      token: userModel.data.token,
    ).then((value)
    {
      //print(value.data.toString());
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(ShopGetCategoriesSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopGetCategoriesErrorState());
    });
  }

  FavoritesModel favoritesModel;

  void getFavoritesData()
  {
    DioHelper.getData(
      url: FAVORITES,
      token: userModel.data.token,
    ).then((value)
    {
      favoritesModel = FavoritesModel.fromJson(value.data);
      // favoritesModel.data.data.forEach((element) {
      //   if(!favorites.containsKey(element.id))
      //   {
      //     favorites.addAll({
      //       element.id : element.
      //     });
      //   }
      // });
      //print(value.data.toString());
      emit(ShopGetFavoritesSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopGetFavoritesErrorState());
    });
  }

  void getProfileData()
  {
    // if(homeData == null)
    // {
    //   DioHelper.getData(
    //     url: HOME,
    //     token: userModel.data.token,
    //   ).then((value)
    //   {
    //     homeData = value.data;
    //     print(value.data.toString());
    //     emit(ShopGetHomeSuccessState());
    //   }).catchError((error)
    //   {
    //     print(error.toString());
    //     emit(ShopGetHomeErrorState());
    //   });
    // }
    DioHelper.getData(
      url: PROFILE,
      token: userModel.data.token,
    ).then((value)
    {
      //print(value.data.toString());
      emit(ShopGetProfileSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(ShopGetProfileErrorState());
    });
  }

  SimpleModel simpleModel;

  void changeFavorite(ProductsModel model)
  {
    favorites[model.id] = !favorites[model.id];

    if(favorites[model.id])
    {
      favoritesModel.data.data.add(
        FavoritesData(
          id: 0,
          product: model,
        ),
      );
    } else
      {
        print('false');

        for(int i = 0 ; i < favoritesModel.data.data.length ; i++)
        {
          if(model.id == favoritesModel.data.data[i].product.id)
          {
            print('innnnn');

            favoritesModel.data.data.removeAt(i);
          }
        }
      }

    emit(ShopChangeFavoritesLoadingState());

    DioHelper.postData(
      url: FAVORITES,
      token: userModel.data.token,
      data:
      {
        'product_id' : model.id,
      }
    ).then((value)
    {
      simpleModel = SimpleModel.fromJson(value.data);

      if(!simpleModel.status)
      {
        favorites[model.id] = !favorites[model.id];
      } else
        {
          getFavoritesData();
        }

      //emit(ShopChangeFavoritesSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      favorites[model.id] = !favorites[model.id];
      emit(ShopChangeFavoritesErrorState());
    });
  }
}
