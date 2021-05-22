import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/shop_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/shop_app/cubit/states.dart';

class ShopFavoritesScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var favoritesModel = ShopCubit.get(context).favoritesModel;

        return ConditionalBuilder(
          condition: favoritesModel != null,
          builder: (context) => Column(
            children:
            [
              // if(state is ShopChangeFavoritesLoadingState)
              //   LinearProgressIndicator(),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => buildListProduct(ShopCubit.get(context).favoritesModel.data.data[index].product, context),
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                  itemCount: ShopCubit.get(context).favoritesModel.data.data.length,
                ),
              ),
            ],
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildListProduct(
      model,
      context, {
        bool isOldPrice = true,
      }) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          height: 120.0,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image(
                    image: NetworkImage(model.image),
                    width: 120.0,
                    height: 120.0,
                  ),
                  if (model.discount != 0 && isOldPrice)
                    Container(
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0,
                      ),
                      child: Text(
                        'DISCOUNT',
                        style: TextStyle(
                          fontSize: 8.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          model.price.toString(),
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.teal,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        if (model.discount != 0 && isOldPrice)
                          Text(
                            model.oldPrice.toString(),
                            style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        Spacer(),
                        IconButton(
                          onPressed: ()
                          {
                            ShopCubit.get(context).changeFavorite(model);
                          },
                          icon: CircleAvatar(
                            radius: 15.0,
                            backgroundColor:
                            ShopCubit.get(context).favorites[model.id]
                                ? Colors.teal
                                : Colors.grey,
                            child: Icon(
                              Icons.favorite_border,
                              size: 14.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}