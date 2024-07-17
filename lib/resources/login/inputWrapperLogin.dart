import 'package:flutter/material.dart';
import 'package:todo_appv1/resources/signup/signupPage.dart';

import 'inputFieldLogin.dart';

class InputWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: InputFieldLogin(),
          ),
          // SizedBox(height: 20,),
          TextButton(onPressed: () {
            print('Pressed Forgot password');
          }, child: Container(
              child: Text('Forgot password',
                style: TextStyle(color: Colors.grey),
              )
            )
          ),
          TextButton(onPressed: () {
            print('Pressed signup');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignupPage()));
          }, child: Container(
              child: Text('Sign in',
                style: TextStyle(color: Colors.blue),
              )
            )
          ),

        ],
      ),
    );
  }
}
