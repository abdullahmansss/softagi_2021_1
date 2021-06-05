import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/social_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/social_app/cubit/states.dart';
import 'package:softagi_2021/models/social_app/social_user_model.dart';
import 'package:softagi_2021/modules/social_app/chat/chat_screen.dart';
import 'package:softagi_2021/shared/components/components.dart';

class SocialHomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => buildUserItem(SocialCubit.get(context).users[index], context),
            separatorBuilder: (context ,index) => Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
            itemCount: SocialCubit.get(context).users.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildUserItem(SocialUserModel model, context) => InkWell(
    onTap: (){
      navigateTo(context: context, widget: ChatScreen(
        socialUserModel: model,
      ),);
    },
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children:
        [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(model.image),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  model.email,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}