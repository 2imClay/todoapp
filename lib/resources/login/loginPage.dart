import 'package:flutter/material.dart';
import 'package:todo_appv1/resources/Login/headerLogin.dart';

import 'inputWrapperLogin.dart';

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.cyan
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80,),
            HeaderLogin(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60)
                )
              ),
              child: InputWrapper(),
            ))
          ],
        ),
      ),
    );
  }
  
}






