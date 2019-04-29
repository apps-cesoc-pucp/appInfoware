import 'package:flutter/material.dart';
import 'package:app_infoware/Screens/HomeScreen.dart';
import 'package:flutter/services.dart';

void main(){
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(new InfowareApp());
}

class InfowareApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Infoware by CESoc',
      theme: ThemeData(
        //Definimos un tema para el AppBar
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          elevation: 2.0,
          textTheme: TextTheme(
            caption: TextStyle(
              color: Colors.black
            )
          )
        ),
        //Definimos un tema para el BottomNavigationBar
      ),
      home: HomeScreen("Infosoft"),
    );
  }
}
