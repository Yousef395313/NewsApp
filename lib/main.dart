import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_application/network/remote/dio_helper.dart';
import 'package:news_application/shared/bloc_observer.dart';
import 'layout/news_app/news_layout.dart';

void main()
{
  Bloc.observer=MyBlocObserver();
  DioHelper.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
const NewsApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color:Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),

      ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
        ),
        primarySwatch: Colors.deepOrange,
    ),
    home: NewsAppScreen(),
    );
  }
}
