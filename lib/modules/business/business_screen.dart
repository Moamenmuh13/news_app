import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var businessList = AppCubit.get(context).businessList;
        return articleBuilder(businessList);
      },
    );
  }
}
