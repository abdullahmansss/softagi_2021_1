import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/cubit.dart';
import 'package:softagi_2021/modules/shop_app/sign_in/cubit/states.dart';
import 'package:softagi_2021/shared/components/components.dart';

class SignInScreen extends StatelessWidget
{
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var safeAreaKey = GlobalKey();

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider(
      create: (BuildContext context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
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
                            height: 20.0,
                          ),
                          if (state is SingInLoadingState)
                            Center(child: CircularProgressIndicator()),
                          if (state is! SingInLoadingState)
                            defaultButton(
                              whenPress: ()
                              {
                                if (formKey.currentState.validate()) {
                                  SignInCubit.get(context).userSignIn(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                }
                              },
                              text: 'Sign in',
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
                                onPressed: () {},
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
      ),
    );
  }
}