abstract class SignInStates {}

class SignInInitialState extends SignInStates {}

class SignInLoadingState extends SignInStates {}

class SignInSuccessState extends SignInStates {
  final String error;

  SignInSuccessState({this.error});
}

class SignInErrorState extends SignInStates {
  final String error;

  SignInErrorState({this.error});
}

class RegisterLoadingState extends SignInStates {}

class RegisterSuccessState extends SignInStates {}

class RegisterErrorState extends SignInStates {}

class CodeSentSuccessState extends SignInStates {}