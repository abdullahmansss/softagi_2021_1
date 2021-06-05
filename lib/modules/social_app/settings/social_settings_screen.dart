import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/social_app/cubit/cubit.dart';
import 'package:softagi_2021/layout/social_app/cubit/states.dart';
import 'package:softagi_2021/modules/social_app/login/social_sign_in_screen.dart';
import 'package:softagi_2021/shared/components/components.dart';

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
                    image: SocialCubit.get(context).profileImage == null ? NetworkImage(
                        SocialCubit.get(context).socialUserModel.image) : FileImage(SocialCubit.get(context).profileImage),
                    fit: BoxFit.cover,
                  ),
                ),
                OutlinedButton(
                  onPressed: ()
                  {
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
                  onPressed: ()
                  {
                    FirebaseAuth.instance.signOut().then((value) {
                      navigateAndFinish(context: context, widget: SocialSignInScreen());
                    });
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
}
