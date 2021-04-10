abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsChangeBottomNavState extends NewsStates {}

class NewsBusinessLoadingState extends NewsStates {}

class NewsBusinessSuccessState extends NewsStates {}

class NewsBusinessErrorState extends NewsStates
{
  final String error;

  NewsBusinessErrorState(this.error);
}