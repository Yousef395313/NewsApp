import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/news_app/cubit/states.dart';

import '../../../modules/business/business_screen.dart';
import '../../../modules/science/science_screen.dart';
import '../../../modules/setting/setting.dart';
import '../../../modules/sports/sports_screen.dart';
import '../../../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() :super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex =0;

  List<BottomNavigationBarItem> bottomItems =[
    BottomNavigationBarItem(
      icon:Icon(
        Icons.business,
      ) ,
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.sports,
      ) ,
      label: "Sports",
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.science,
      ) ,
      label: "Science",
    ),

  ];

  List<Widget> Screens =
  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),

  ];

  void changeBottomNavBar(int index)
  {
    if(index ==1)
    {
      getSports();
    }

    if(index ==2)
    {
      getScience();
    }
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<dynamic> business =[];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      // url: 'v2/top-headlines',
      // query: {
      //   "country" : "eg",
      //   "category" : "business",
      //   "apiKey" : "65f7f556ec76449fa7dc7c0069f040ca",
      // },
      url: 'v2/top-headlines',
      query: {
        "country" : "us",
        "category" : "business",
        "apiKey" : "374e9e250f0049d89b3878721c6640fd",
      },
    ).then((value){
      business =value.data["articles"];
      print(business);
      emit(NewsGetBusinessSuccessScreen());
    }).catchError((Error) {
      print(Error.toString());
      emit(NewsGetBusinessErrorScreen(Error.toString()));
    });
  }

  List<dynamic> sports =[];

  void getSports()
  {
    emit(NewsGetSportsLoadingState());
    if(sports.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          "country" : "us",
          "category" : "sports",
          "apiKey" : "374e9e250f0049d89b3878721c6640fd",
        },
      ).then((value){
        sports =value.data["articles"];
        print(sports);
        emit(NewsGetSportsSuccessScreen());
      }).catchError((Error) {
        print(Error.toString());
        emit(NewsGetSportsErrorScreen(Error.toString()));
      });
    }
    else
      {
        emit(NewsGetSportsSuccessScreen());
      }

  }

  List<dynamic> science =[];

  void getScience()
  {
    if(science.length ==0)
      {
        emit(NewsGetScienceLoadingState());
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            "country" : "us",
            "category" : "science",
            "apiKey" : "374e9e250f0049d89b3878721c6640fd",
          },
        ).then((value){
          science =value.data["articles"];
          print(science);
          emit(NewsGetScienceSuccessScreen());
        }).catchError((Error) {
          print(Error.toString());
          emit(NewsGetScienceErrorScreen(Error.toString()));
        });
      }
    else
        {
          emit(NewsGetScienceSuccessScreen());
        }
  }
}