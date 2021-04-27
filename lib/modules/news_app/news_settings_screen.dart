import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/news_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/news_app/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class Countries
{
  final String country;
  final String code;

  Countries({this.country, this.code});
}

class NewsSettingsScreen extends StatelessWidget
{
  List<Countries> countries =
  [
    Countries(
      country: 'Egypt',
      code: 'eg',
    ),
    Countries(
      country: 'United States',
      code: 'us',
    ),
  ];

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:
            [
              Row(
                children:
                [
                  Expanded(
                    child: Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  CupertinoSwitch(
                      value: NewsCubit.get(context).isDark,
                      onChanged: (value)
                      {
                        NewsCubit.get(context).changeThemeMode();
                      },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Row(
                children:
                [
                  Expanded(
                    child: Text(
                      'Select Country',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  DropdownButton<String>(
                    items: countries.map((Countries value)
                    {
                      return DropdownMenuItem<String>(
                        value: value.country,
                        child: Text(value.country),
                      );
                    }).toList(),
                    value: NewsCubit.get(context).selectedCountry,
                    onChanged: (value)
                    {
                      print(value);
                      NewsCubit.get(context).changeSelectedCountry(value);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}