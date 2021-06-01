import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:softagi_2021/layout/shop_app/shop_layout.dart';
import 'package:softagi_2021/models/shop_app/user_model.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:softagi_2021/shared/network/end_points.dart';
import 'package:softagi_2021/shared/network/local/cache_helper.dart';
import 'package:softagi_2021/shared/network/remote/dio_helper.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void userSignIn({
    @required String email,
    @required String password,
    @required BuildContext context,
  }) async {
    emit(SignInLoadingState());

    // try
    // {
    //   var response = await DioHelper.postData(
    //     url: LOGIN,
    //     data: {
    //       'email':email,
    //       'password':password,
    //     },
    //   );
    //
    //   userModel = UserModel.fromJson(response.data);
    //
    //   if(userModel.status)
    //   {
    //     print('success');
    //     print(userModel.data.name);
    //     print(userModel.data.token);
    //   } else
    //   {
    //     print(userModel.message);
    //   }
    //
    //   emit(SingInSuccessState());
    // }
    // catch(error)
    // {
    //   print(error.toString());
    //   emit(SingInErrorState());
    // }

    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      userModel = UserModel.fromJson(value.data);

      if (userModel.status) {
        print('success');
        print(value.statusCode);
        print(userModel.data.name);
        print(userModel.data.token);

        CacheHelper.setData(
          key: 'userData',
          value: jsonEncode(value.data),
        );

        navigateAndFinish(
          context: context,
          widget: ShopLayout(),
        );
      } else {
        print(userModel.message);
      }

      emit(SignInSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SignInErrorState());
    });
  }

  void userRegister({
    @required String email,
    @required String password,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.uid);
      currentUser = value.user;
      FirebaseFirestore.instance.collection('users').doc(value.user.uid).set({
        'name': 'name',
        'email': email,
        'Uid': value.user.uid,
        'bio': 'software engineer',
        'image':
            'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg',
      }).then((value) {
        emit(RegisterSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(RegisterErrorState());
      });
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

  void userFirebaseLogin({
    @required String email,
    @required String password,
  }) {
    emit(SignInLoadingState());

    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user.uid);
      emit(SignInSuccessState(
        error: value.user.uid,
      ));
    }).catchError((error) {
      print(error.toString());
      // [firebase_auth/wrong-password]
      // [firebase_auth/user-not-found]

      String err;

      if (error.toString().contains('[firebase_auth/wrong-password]')) {
        print('password error');
        err = 'password error';
      } else if (error.toString().contains('[firebase_auth/user-not-found]')) {
        err = 'user not found';
      }

      emit(SignInErrorState(
        error: err,
      ));
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void phoneAuth({String code, String mobile}) async {
    var auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: '+2$mobile',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then((value) {
          print(value.user.uid);
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int resendToken) async {
        emit(CodeSentSuccessState());
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = code;

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
