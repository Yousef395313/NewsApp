import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/news_app/cubit/states.dart';
import 'package:news_application/network/remote/dio_helper.dart';

import 'cubit/cubit.dart';

class NewsAppScreen extends StatelessWidget {
  const NewsAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener:(context ,states){} ,
        builder: (context ,states)
        {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                  "News App"
              ),
              actions: [
                IconButton(
                    onPressed: (){},
                    icon:Icon(
                      Icons.search,
                    ),
                )
              ],
            ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items:cubit.bottomItems ,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeBottomNavBar(index);
              },
            ),
          );
        },
      ),
    );
  }
}

