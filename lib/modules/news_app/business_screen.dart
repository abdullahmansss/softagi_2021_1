import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/news_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/news_app/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class BusinessScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: NewsCubit.get(context).business.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildNewsItem(NewsCubit.get(context).business[index]),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: NewsCubit.get(context).business.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildNewsItem(article) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            children:
            [
              Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        '${article['urlToImage']}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        height: 1.3,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${article['publishedAt']}',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}