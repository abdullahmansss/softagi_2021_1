import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/layout/social_app/social_layout.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/cubit.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class SocialRegisterInScreen extends StatelessWidget
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var safeAreaKey = GlobalKey();

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state)
      {
        if (state is RegisterSuccessState)
        {
          navigateAndFinish(
            context: context,
            widget: SocialLayout(),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
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
                          'Register',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          'Register now to find friends',
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
                          height: 20.0,
                        ),
                        if (state is SignInLoadingState)
                          Center(child: CircularProgressIndicator()),
                        if (state is! SignInLoadingState)
                          defaultButton(
                            whenPress: () {
                              if (formKey.currentState.validate()) {
                                SignInCubit.get(context).userRegister(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },
                            text: 'register',
                            upperCase: true,
                            fullWidth: true,
                          ),
                        // SizedBox(
                        //   height: 10.0,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Text(
                        //       'Don\'t have ann account?',
                        //     ),
                        //     TextButton(
                        //       onPressed: () {},
                        //       child: Text(
                        //         'REGISTER',
                        //       ),
                        //     ),
                        //   ],
                        // ),
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