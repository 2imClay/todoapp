import 'package:flutter/material.dart';
import 'inputFieldSignup.dart';

class InputWrapperSignin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: InputFieldSignin(),
          ),
          SizedBox(height: 10,),
          TextButton(onPressed: () {
            print('Pressed back to login');
            Navigator.pop(context);
          }, child: Container(
              child: Text('Back to login',
                style: TextStyle(color: Colors.blue),
              )
            )
          ),

          SizedBox(height: 0,),
        ],
      ),
    );
  }
}