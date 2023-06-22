import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsLayout extends StatelessWidget {
  NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusinessData(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [IconButton(onPressed: () {
              }, icon: const Icon(Icons.search))],
              title: const Text('News App'),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
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
