import 'package:flutter/material.dart';
import 'package:todo_appv1/resources/signup//headerSignup.dart';

import 'inputWrapperSignup.dart';

class SignupPage extends StatelessWidget{
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
            HeaderSignin(),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60)
                )
              ),
              child: InputWrapperSignin(),
            ))
          ],
        ),
      ),
    );
  }
  
}






