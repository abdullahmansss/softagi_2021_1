import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/models/social_app/message_model.dart';
import 'package:softagi_2021/models/social_app/social_user_model.dart';
import 'package:softagi_2021/modules/social_app/chat/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class ChatCubit extends Cubit<ChatStates>
{
  ChatCubit() : super(ChatInitState());

  static ChatCubit get(context) => BlocProvider.of(context);

  TextEditingController messageController = TextEditingController();

  void sendMessage({
    SocialUserModel receiverModel,
  }) {
    emit(ChatSendMessageLoadingState());

    MessageModel messageModel = MessageModel(
      time: DateTime.now().toString(),
      message: messageController.text,
      receiverUid: receiverModel.Uid,
      senderUid: currentUser.uid,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection('chats')
        .doc(receiverModel.Uid)
        .collection('messages')
        .add(messageModel.toJson())
        .then((value) {
      emit(ChatSendMessageSuccessState());
    }).catchError((error) {
      emit(ChatSendMessageErrorState());
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverModel.Uid)
        .collection('chats')
        .doc(currentUser.uid)
        .collection('messages')
        .add(messageModel.toJson())
        .then((value) {
      emit(ChatSendMessageSuccessState());
    }).catchError((error) {
      emit(ChatSendMessageErrorState());
    });
  }

  List<MessageModel> messages = [];

  void getMessages({
    SocialUserModel receiverModel,
  }) {
    emit(ChatGetMessagesLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .collection('chats')
        .doc(receiverModel.Uid)
        .collection('messages')
        .orderBy('time')
        .snapshots()
        .listen((event) {
      messages = [];

      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });

      emit(ChatGetMessagesSuccessState());
    });
  }
}