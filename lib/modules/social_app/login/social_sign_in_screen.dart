import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/cubit.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/states.dart';
import 'package:softagi_2021/modules/social_app/register/social_register_in_screen.dart';
import 'package:softagi_2021/shared/components/components.dart';

class SocialSignInScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var safeAreaKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            gravity: ToastGravity.BOTTOM,
          );
        }

        if (state is SignInSuccessState) {
          Fluttertoast.showToast(
            msg: state.error,
            gravity: ToastGravity.BOTTOM,
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            key: safeAreaKey,
            child: Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          icon: Icons.email,
                          validate: 'email address must not be empty',
                          onChange: (value) {},
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'Password',
                          icon: Icons.lock,
                          validate: 'password is too short',
                          onChange: (value) {},
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if(state is! CodeSentSuccessState)
                        defaultFormField(
                          controller: phoneController,
                          type: TextInputType.phone,
                          label: 'Phone',
                          icon: Icons.phone,
                          validate: 'phone must not be empty',
                          onChange: (value) {},
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if(state is CodeSentSuccessState)
                        defaultFormField(
                          controller: codeController,
                          type: TextInputType.number,
                          label: 'Code',
                          icon: Icons.code,
                          validate: 'code must not be empty',
                          onChange: (value) {},
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        if(state is! CodeSentSuccessState)
                        defaultButton(
                          whenPress: ()
                          {
                            SignInCubit.get(context).phoneAuth(
                              mobile: phoneController.text,
                            );
                          },
                          text: 'send code',
                          upperCase: true,
                          fullWidth: true,
                        ),
                        if(state is CodeSentSuccessState)
                          defaultButton(
                          whenPress: ()
                          {
                            SignInCubit.get(context).phoneAuth(
                              code: codeController.text,
                            );
                          },
                          text: 'continue',
                          upperCase: true,
                          fullWidth: true,
                        ),
                        if (state is SignInLoadingState)
                          Center(child: CircularProgressIndicator()),
                        if (state is! SignInLoadingState)
                          defaultButton(
                            whenPress: () {
                              if (formKey.currentState.validate()) {
                                SignInCubit.get(context).userFirebaseLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },
                            text: 'Sign in',
                            upperCase: true,
                            fullWidth: true,
                          ),
                        if(false)
                        defaultButton(
                          whenPress: () {
                            SignInCubit.get(context)
                                .signInWithGoogle()
                                .then((value)
                            {
                              Fluttertoast.showToast(
                                msg: '${value.user.uid} \n ${value.user.email}',
                                gravity: ToastGravity.BOTTOM,
                              );
                            })
                                .catchError((error) {});
                          },
                          text: 'continue with google',
                          upperCase: true,
                          fullWidth: true,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have ann account?',
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(
                                  context: context,
                                  widget: SocialRegisterInScreen(),
                                );
                              },
                              child: Text(
                                'REGISTER',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
