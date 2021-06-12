import 'package:conditional_builder/conditional_builder.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:softagi_2021/layout/social_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/social_app/cubit/states.dart';
import 'package:softagi_2021/modules/social_app/login/social_sign_in_screen.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:softagi_2021/shared/network/remote/dio_helper.dart';

class SocialSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit, SocialStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! SocialGetProfileLoadingState,
          builder: (context) => Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  child: Image(
                    image: SocialCubit.get(context).profileImage == null
                        ? NetworkImage(
                            SocialCubit.get(context).socialUserModel.image)
                        : FileImage(SocialCubit.get(context).profileImage),
                    fit: BoxFit.cover,
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    SocialCubit.get(context).getProfileImage();
                  },
                  child: Text(
                    'choose image',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  SocialCubit.get(context).socialUserModel.name,
                ),
                Text(
                  SocialCubit.get(context).socialUserModel.email,
                ),
                Text(
                  SocialCubit.get(context).socialUserModel.bio,
                ),
                OutlinedButton(
                  onPressed: () {
                    // FirebaseAuth.instance.signOut().then((value) {
                    //   navigateAndFinish(context: context, widget: SocialSignInScreen());
                    // });
                    facebookLogin();
                  },
                  child: Text(
                    'Logout',
                  ),
                ),
              ],
            ),
          ),
          fallback: (context) => Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  void facebookLogin() async {
    final LoginResult result = await FacebookAuth.instance.login(
      permissions: [],
    );

    // by default we request the email and the public profile

    // or FacebookAuth.i.login()

    if (result.status == LoginStatus.success) {
      // you are logged
      print(result.accessToken.token);
      print(result.accessToken.userId);
      print(result.message);

      Dio dio = Dio(
        BaseOptions(
          baseUrl: 'https://graph.facebook.com/',
          receiveDataWhenStatusError: true,
        ),
      );

      dio.get('v2.12/me', queryParameters:
      {
        'fields': 'name,first_name,last_name,picture',
        'access_token': result.accessToken.token,
      }).then((value) {
        print(value.data);

        dio.get('${result.accessToken.userId}/picture', queryParameters: {
          'height' : 1024,
          'width' : 1024,
        },).then((value)
        {
          print(value.data);
        });

      }).catchError((error)
      {
        print(error.toString());
      });
    }
  }
}
