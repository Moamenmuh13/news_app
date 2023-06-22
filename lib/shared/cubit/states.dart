abstract class AppState {}

class AppInitialState extends AppState {}

class AppChangeBottomNavState extends AppState {}

class AppSportsLoadingState extends AppState {}
class AppScienceLoadingState extends AppState {}
class AppBusinessLoadingState extends AppState {}

class AppResponseFailedState extends AppState {
  late final String error;
  AppResponseFailedState(this.error);
}

class AppBusinessSuccessState extends AppState {}
class AppSportsSuccessState extends AppState {}
class AppScienceSuccessState extends AppState {}
