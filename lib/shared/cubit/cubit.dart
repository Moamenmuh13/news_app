import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/setting/setting_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavList = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: "Settings"),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;

    switch (index) {
      case 1:
        {
          getSportsData();
        }
        break;
      case 2:
        {
          getScienceData();
        }
        break;
    }
    emit(AppChangeBottomNavState());
  }

  List businessList = [];
  List sportsList = [];
  List scienceList = [];

  void getBusinessData() {
    emit(AppBusinessLoadingState());
    if (businessList.isEmpty) {
      DioHelper.getData(path: 'v2/top-headlines', query: {
        "country": "us",
        "category": "business",
        "apiKey": "5ca9cff249724442bc8509e066d58122",
      }).then((value) {
        businessList = value?.data['articles'];
        emit(AppBusinessSuccessState());
      }).catchError((error) {
        emit(AppResponseFailedState(error.toString()));
      });
    } else {
      emit(AppBusinessSuccessState());
    }
  }

  void getSportsData() {
    emit(AppSportsLoadingState());
    if (sportsList.isEmpty) {
      DioHelper.getData(path: 'v2/top-headlines', query: {
        "country": "us",
        "category": "sports",
        "apiKey": "5ca9cff249724442bc8509e066d58122",
      }).then((value) {
        sportsList = value?.data['articles'];
        emit(AppSportsSuccessState());
      }).catchError((error) {
        emit(AppResponseFailedState(error.toString()));
      });
    } else {
      emit(AppSportsSuccessState());
    }
  }

  void getScienceData() {
    emit(AppScienceSuccessState());
    if(scienceList.isEmpty){
      DioHelper.getData(path: 'v2/top-headlines', query: {
        "country": "us",
        "category": "science",
        "apiKey": "5ca9cff249724442bc8509e066d58122",
      }).then((value) {
        scienceList = value?.data['articles'];
        emit(AppScienceSuccessState());
      }).catchError((error) {
        emit(AppResponseFailedState(error.toString()));
      });
    }
    else{
      emit(AppScienceSuccessState());
    }
  }
}
