import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:softagi_2021/layout/social_app/cubit/states.dart';
import 'package:softagi_2021/models/social_app/social_user_model.dart';
import 'package:softagi_2021/modules/social_app/chat/chat_screen.dart';
import 'package:softagi_2021/modules/social_app/home/social_home_screen.dart';
import 'package:softagi_2021/modules/social_app/settings/social_settings_screen.dart';
import 'package:softagi_2021/shared/components/components.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SocialCubit extends Cubit<SocialStates> {
  SocialCubit() : super(SocialInitState());

  static SocialCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void setOnAppOpened(context)
  {
    FirebaseMessaging.onMessageOpenedApp.listen((event)
    {
      emit(SocialSetOnAppOpenedState());

      print('app opened');

      navigateTo(
        context: context,
        widget: ChatScreen(
          name: event.data['name'],
          uId: event.data['id'],
        ),
      );
    });
  }

  void changeIndex(int index) {
    currentIndex = index;
    emit(SocialChangeBottomState());
  }

  List<Widget> screens = [
    SocialHomeScreen(),
    SocialSettingsScreen(),
  ];

  SocialUserModel socialUserModel;

  void getProfile() {
    emit(SocialGetProfileLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .snapshots()
        .listen((value) {
      socialUserModel = SocialUserModel.fromJson(value.data());
      emit(SocialGetProfileSuccessState());
    });

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(currentUser.uid)
    //     .get()
    //     .then((value)
    // {
    //
    //   socialUserModel = SocialUserModel.fromJson(value.data());
    //   emit(SocialGetProfileSuccessState());
    // }).catchError((error) {
    //   emit(SocialGetProfileErrorState());
    // });
  }

  List<SocialUserModel> users = [];

  void getUsers() {
    emit(SocialGetUsersLoadingState());

    FirebaseFirestore.instance
    .collection('users')
    //.limit(1)
    .snapshots()
    .listen((event) {
      users = [];
      event.docs.forEach((element) {
                users.add(SocialUserModel.fromJson(element.data()));
              });

              emit(SocialGetUsersSuccessState());
    });

    // FirebaseFirestore.instance
    //     .collection('users')
    //     .get()
    //     .then((value) {
    //       value.docs.forEach((element) {
    //         users.add(SocialUserModel.fromJson(element.data()));
    //       });
    //
    //       emit(SocialGetUsersSuccessState());
    // })
    //     .catchError((error) {
    //       print(error.toString());
    //   emit(SocialGetUsersErrorState());
    // });
  }

  File profileImage;
  var picker = ImagePicker();

  void getProfileImage()
  {
    picker.getImage(
      source: ImageSource.gallery,
    ).then((value)
    {
      if (value != null)
      {
        profileImage = File(value.path);
        print(value.path);
        uploadProfileImage();
        emit(SocialProfileImagePickedSuccessState());
      } else {
        print('No image selected.');
        emit(SocialProfileImagePickedErrorState());
      }
    });
  }

  void uploadProfileImage()
  {
    emit(SocialUploadProfileImageLoadingState());

    // /data/user/0/com.softagi.softagi_2021/cache/image_picker1013209558804268959.png

    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage.path).pathSegments.last}')
        .putFile(profileImage)
        .then((value)
    {
      value.ref.getDownloadURL().then((value)
      {
        //emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUserData(value);
      }).catchError((error)
      {
        emit(SocialUploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState());
    });
  }

  void updateUserData(String url)
  {
    socialUserModel.image = url;

    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .update(socialUserModel.toJson())
        .then((value)
    {
      emit(SocialUpdateUserDataSuccessState());
    })
        .catchError((error){
      emit(SocialUpdateUserDataErrorState());
    });
  }
}