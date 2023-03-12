import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_application/layout/news_app/cubit/states.dart';

Widget buildArticleItem(article) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: article['urlToImage'] != null
              ? DecorationImage(
            image: NetworkImage(article['urlToImage']),
            fit: BoxFit.cover,
          )
              : DecorationImage(
            image: NetworkImage(
                'urlImage'),
          ),
          ),
        ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "${article["title"]} ",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                "${article["publishedAt"]}",
              ),
            ],
          ),
        ),
      ),
    ],
  )
);

Widget myDivider() => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);

Widget articleBuilder(list)=> ConditionalBuilder(
  condition:list.length>0 ,
  builder:(context)=>
      ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder:(context , index )=>buildArticleItem(list[index]),
        separatorBuilder:(context , index) => myDivider() ,
        itemCount: 10,),
  fallback:(context)=> const Center(child: CircularProgressIndicator()) ,
);


