import "package:flutter/material.dart";
import 'package:play_store_clone/constants/appList.dart';
import 'package:play_store_clone/services/app.dart';

class AppList extends StatefulWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  State<AppList> createState() => _AppListState();
}

class _AppListState extends State<AppList> {
  @override
  Widget build(BuildContext context) {

    String searchValue = ModalRoute.of(context)!.settings.arguments as String;
    List<Map<String, String>> appList = recentActivities.where((act)=>act['name']!.toLowerCase().contains(searchValue)).toList();

    return SafeArea(
      child:Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.white,
          iconTheme:IconThemeData(color:Colors.black),
        ),
        body:ListView.builder(
          itemCount:appList.length,
            itemBuilder:(context,index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical:1.0,horizontal:4.0),
                child:Card(
                  child:ListTile(
                    onTap:(){
                      Navigator.pushNamed(
                          context,
                          '/downloadApp',
                          arguments:App(
                              image:appList[index]['image']??'',
                              name:appList[index]['name']??'',
                              rating:appList[index]['rating']??'',
                              details:appList[index]['details']??''
                          )
                      );
                  },
                    title:Text(appList[index]['name']??''),
                    leading:Image.network(appList[index]['image']??"")
                  )
                )
              );
            }
        )
      )
    );
  }
}
