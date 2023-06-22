import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/bloc_observer.dart';
import 'package:news_app/layouts/news_layout.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() {
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(color: Colors.black , fontSize: 24.0 , fontWeight: FontWeight.bold),
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.green,
            statusBarIconBrightness: Brightness.dark
          )
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 20.0 ,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
        )
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
