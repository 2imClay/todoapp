import 'package:flutter/material.dart';
import 'package:todo_appv1/api/authService.dart';
import 'package:todo_appv1/blocs/validation_bloc.dart';
import 'package:todo_appv1/resources/Login/loginPage.dart';

class InputFieldSignin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputFieldSigninWidget();
  }
}

class InputFieldSigninWidget extends State<InputFieldSignin> {
  final AuthService authService = AuthService();
  ValidationBloc bloc = new ValidationBloc();

  bool _showPass = false;

  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Container(
            alignment: AlignmentDirectional.centerEnd,
            child: StreamBuilder(
              stream: bloc.userStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Enter your username',
                    errorText: snapshot.hasError ? snapshot.error.toString() : null,
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                );
              }
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget>[
              StreamBuilder(
                stream: bloc.passStream,
                builder: (context, snapshot) {
                  return TextField(
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    controller: _passwordController,
                    obscureText: !_showPass,
                    decoration: InputDecoration(
                      labelText: 'Enter your password',
                      errorText: snapshot.hasError ? snapshot.error.toString() : null,
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  );
                }
              ),
              GestureDetector(
                onTap: showPass,
                child: Text(
                  _showPass ? 'HIDE' : 'SHOW',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: <Widget>[
              StreamBuilder(
                stream: bloc.emailStream,
                builder: (context, snapshot) {
                  return TextField(
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter your email',
                      errorText: snapshot.hasError ? snapshot.error.toString() : null,
                      labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,10,0,0),
          child: TextButton(
              onPressed: () {
                print('Pressed Sign up');
                onSigninClicked();
                _signUp();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.cyan, borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  void _signUp() async{
    final username = _usernameController.text;
    final email = _emailController.text;
    final pass = _passwordController.text;

    final success = await authService.signUp(username, email, pass);
  }

  void showPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }


  void onSigninClicked(){
    var isValid = bloc.isValidSignUp(_usernameController.text,
        _passwordController.text,
        _emailController.text);
    if(isValid){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}
