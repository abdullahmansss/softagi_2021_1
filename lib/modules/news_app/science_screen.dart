import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/news_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/news_app/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            NewsCubit.get(context).getScience();
          },
          child: newsBuilder(NewsCubit.get(context).science, context),
        );
      },
    );
  }
}
