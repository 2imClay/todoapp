import 'package:flutter/material.dart';
import 'package:todo_appv1/resources/Login/loginPage.dart';


void main() async{

  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}