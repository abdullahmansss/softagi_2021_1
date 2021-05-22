import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/shop_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/shop_app/cubit/states.dart';
import 'package:softagi_2021/models/shop_app/categories_model.dart';

class ShopCategoriesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var categories = ShopCubit.get(context).categoriesModel.data.data;

        return ConditionalBuilder(
          condition: categories != null,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => buildCatItem(categories[index]),
            separatorBuilder: (context, index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: categories.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildCatItem(CategoriesDataDetailsModel model) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children:
      [
        Image(
          width: 60.0,
          height: 60.0,
          image: NetworkImage(model.image),
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          model.name,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
