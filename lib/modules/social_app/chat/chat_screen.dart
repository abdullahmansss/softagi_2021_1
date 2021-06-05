import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/models/social_app/message_model.dart';
import 'package:softagi_2021/models/social_app/social_user_model.dart';
import 'package:softagi_2021/modules/social_app/chat/cubit/cubit.dart';
import 'package:softagi_2021/modules/social_app/chat/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class ChatScreen extends StatelessWidget {
  SocialUserModel socialUserModel;

  ChatScreen({
    this.socialUserModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ChatCubit()
        ..getMessages(
          receiverModel: this.socialUserModel,
        ),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                this.socialUserModel.name,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ConditionalBuilder(
                    condition: ChatCubit.get(context).messages.length > 0,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          MessageModel model =
                          ChatCubit.get(context).messages[index];

                          if (model.senderUid == currentUser.uid)
                            return myMessage(model);

                          return otherMessage(model);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20.0,
                        ),
                        itemCount: ChatCubit.get(context).messages.length,
                      ),
                    ),
                    fallback: (context) => Center(child: CircularProgressIndicator()),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: ChatCubit.get(context).messageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'type your message',
                            suffixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(
                                end: 16.0,
                              ),
                              child: FloatingActionButton(
                                mini: true,
                                onPressed: () {
                                  ChatCubit.get(context).sendMessage(
                                    receiverModel: this.socialUserModel,
                                  );
                                },
                                heroTag: 'send',
                                child: Icon(
                                  Icons.send,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget myMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.teal[200],
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(16.0),
              topEnd: Radius.circular(16.0),
              topStart: Radius.circular(16.0),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 8.0,
          ),
          child: Text(
            model.message,
          ),
        ),
      );

  Widget otherMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(16.0),
              topEnd: Radius.circular(16.0),
              topStart: Radius.circular(16.0),
            ),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 8.0,
          ),
          child: Text(
            model.message,
          ),
        ),
      );
}
