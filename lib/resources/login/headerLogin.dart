import 'package:flutter/material.dart';

class HeaderLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text('Log in',style: TextStyle(color: Colors.white, fontSize: 40),),
          ),
          Center(
            child: Text('Welcome to TO-DO app', style: TextStyle(color: Colors.white, fontSize: 15),),
          )
        ],
      ),
    );
  }

}