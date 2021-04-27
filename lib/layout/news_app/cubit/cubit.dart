import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/news_app/cubit/states.dart';
import 'package:softagi_2021/modules/news_app/business_screen.dart';
import 'package:softagi_2021/modules/news_app/news_settings_screen.dart';
import 'package:softagi_2021/modules/news_app/science_screen.dart';
import 'package:softagi_2021/modules/news_app/sports_screen.dart';
import 'package:softagi_2021/shared/network/local/cache_helper.dart';
import 'package:softagi_2021/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    NewsSettingsScreen(),
  ];

  List<String> titles = [
    'Business',
    'Sports',
    'Science',
    'Settings',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(NewsChangeBottomNavState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsBusinessLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'fa66ecc50e45431ebc3e3effe4d152c5',
      },
    ).then((response) {
      print(response.data);
      business = response.data['articles'];
      print(business.length);

      emit(NewsBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsSportsLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'fa66ecc50e45431ebc3e3effe4d152c5',
      },
    ).then((response) {
      print(response.data);
      sports = response.data['articles'];
      print(sports.length);

      emit(NewsSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsScienceLoadingState());

    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'fa66ecc50e45431ebc3e3effe4d152c5',
      },
    ).then((response) {
      print(response.data);
      science = response.data['articles'];
      print(science.length);

      emit(NewsScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void startSearch(String text) {
    emit(NewsSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': text,
        'apiKey': 'fa66ecc50e45431ebc3e3effe4d152c5',
      },
    ).then((response) {
      print(response.data);
      search = response.data['articles'];
      print(search.length);

      emit(NewsSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeThemeMode() {
    isDark = !isDark;
    CacheHelper.setData(
      key: 'isDark',
      value: isDark,
    ).then((value) {
      print('success');
      emit(NewsChangeThemeModeState());
    });
  }

  void setDataFromSharedPreferences({
  @required bool fromShared,
  @required String savedCountryCode,
})
  {
    isDark = fromShared;
    countryCode = savedCountryCode;

    switch (countryCode)
    {
      case 'eg':
        selectedCountry = 'Egypt';
        break;
      case 'us':
        selectedCountry = 'United States';
        break;
    }

    emit(NewsChangeThemeModeState());
  }

  String selectedCountry = 'Egypt';
  String countryCode = 'eg';

  void changeSelectedCountry(String code)
  {
    countryCode = code;

    // switch (selectedCountry)
    // {
    //   case 'Egypt':
    //     countryCode = 'eg';
    //     break;
    //   case 'United States':
    //     countryCode = 'us';
    //     break;
    // }

    CacheHelper.setData(
      key: 'countryCode',
      value: countryCode,
    ).then((value)
    {
      getBusiness();
      getSports();
      getScience();

      emit(NewsChangeSelectedCountryState());
    });
  }
}