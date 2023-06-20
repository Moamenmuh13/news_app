import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [IconButton(onPressed: () {

              }, icon: Icon(Icons.search))],
              title: Text('News App'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                cubit.getBusinessData();
              },
              child: Icon(Icons.add),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                cubit.changeBottomNav(value);
              },
              currentIndex: cubit.currentIndex,
              items: cubit.bottomNavList,
            ),
          );
        },
      ),
    );
  }
}
