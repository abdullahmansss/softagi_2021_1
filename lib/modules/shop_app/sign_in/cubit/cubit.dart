import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/shop_app/shop_layout.dart';
import 'package:softagi_2021/models/shop_app/user_model.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';
import 'package:softagi_2021/shared/network/end_points.dart';
import 'package:softagi_2021/shared/network/local/cache_helper.dart';
import 'package:softagi_2021/shared/network/remote/dio_helper.dart';

class SignInCubit extends Cubit<SignInStates>
{
  SignInCubit() : super(SingInInitialState());

  static SignInCubit get(context) => BlocProvider.of(context);

  UserModel userModel;

  void userSignIn({
    @required String email,
    @required String password,
    @required BuildContext context,
  }) async
  {
    emit(SingInLoadingState());

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

      emit(SingInSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SingInErrorState());
    });
  }
}