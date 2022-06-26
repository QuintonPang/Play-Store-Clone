import 'package:flutter/material.dart';
import 'package:play_store_clone/pages/home.dart';
import 'package:play_store_clone/pages/downloadApp.dart';
import 'package:play_store_clone/pages/appList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:'/',
      routes:{
        '/':(context)=>Home(),
        '/downloadApp':(context)=>DownloadApp(),
        '/appList':(context)=>AppList(),
      }
    );
  }
}

