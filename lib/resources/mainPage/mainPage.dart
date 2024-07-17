import 'package:flutter/material.dart';

class MainPage extends StatefulWidget{



  @override
  State<StatefulWidget> createState() {
    return ProcessWidget();
  }
}

class ProcessWidget extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text(
            'Trang chủ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Back to login'
          ),
        ),
      ),
    );
  }
}