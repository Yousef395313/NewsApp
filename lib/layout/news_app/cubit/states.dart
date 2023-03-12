abstract class NewsStates {

}
class NewsInitialState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessScreen extends NewsStates {}

class NewsGetBusinessErrorScreen extends NewsStates
{
  final String error;
  NewsGetBusinessErrorScreen(this.error);

}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessScreen extends NewsStates {}

class NewsGetSportsErrorScreen extends NewsStates
{
  final String error;
  NewsGetSportsErrorScreen(this.error);

}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessScreen extends NewsStates {}

class NewsGetScienceErrorScreen extends NewsStates
{
  final String error;
  NewsGetScienceErrorScreen(this.error);

}

class NewsBottomNavState extends NewsStates{}