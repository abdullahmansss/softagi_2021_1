import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/cubit/cubit.dart';
import 'package:softagi_2021/layout/news_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/news_app/cubit/states.dart';
import 'package:softagi_2021/layout/news_app/news_layout.dart';
import 'package:softagi_2021/shared/bloc_observer.dart';
import 'package:softagi_2021/shared/network/remote/dio_helper.dart';

// main method in app
void main()
{
  Bloc.observer = MyBlocObserver();

  DioHelper.init();

  // run my app method
  // param is object from Widget class
  runApp(MyApp());
}

// 1. stateless
// 2. stateful

// main class extends widget
class MyApp extends StatelessWidget {
  // main method of class to build screen UI
  @override
  Widget build(BuildContext context) {
    // material app object wrap all screens
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => TodoCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => NewsCubit()..getBusiness()..getSports()..getScience(),
        ),
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Jannah',
              primarySwatch: Colors.teal,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              textTheme: TextTheme(
                subtitle1: TextStyle(
                  fontSize: 18.0,
                  height: 1.5,
                ),
              ),
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.white12,
              fontFamily: 'Jannah',
              primarySwatch: Colors.teal,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white12,
              ),
              textTheme: TextTheme(
                subtitle1: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
              textDirection: TextDirection.ltr,
              child: NewsHomeScreen(),
            ),
          );
        },
      ),
    );
  }
}

// 1. design                50%
// 2. code implementation   50%

// 1. splash screen module.     2 day
// 2. login module.             4 days
// 3. home module ().              12 days
// 4. package details module.   4 days
// 5. profile module.           4 days
// 6. add package module.       6 days
// 7. previous works module.    2 day
// 8. previous packages module. 2 day
// 9. notifications module.     2 day
// 10. search module.           4 days

// total 42 days * 8 hours = 336 hours
// 336 * 200 = 67,200 L.E

// 50% first day
// 25% 21th day
// 25% 42th day

// 1. analysis
// 2. UI & UX
// 3. Back End
// 4. Mobile Design
// 5. Mobile Back End

// stateless
// stateful
