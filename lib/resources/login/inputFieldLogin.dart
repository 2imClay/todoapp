import 'package:flutter/material.dart';

import '../../api/authService.dart';
import '../../blocs/validation_bloc.dart';
import '../mainPage/mainPage.dart';

class InputFieldLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputFieldWidget();
  }
}

class InputFieldWidget extends State<StatefulWidget> {
  final AuthService authService = AuthService();
  bool _showPass = false;
  ValidationBloc bloc = new ValidationBloc();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  String message ='';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Container(
            child: StreamBuilder(
              stream: bloc.emailStream,
              builder: (context, snapshot) {
                return TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter your email',
                    errorText: snapshot.hasError ? snapshot.error.toString() : null,
                    labelStyle: TextStyle(color: Colors.grey),
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
                    controller: _passwordController,
                    style: TextStyle(fontSize: 15, color: Colors.black),
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
          padding: const EdgeInsets.fromLTRB(0,30,0,0),
          child: TextButton(
              onPressed: () {
                print('Pressed login');
                onLoginClicked();
                _login();
              },
              child: Container(
                height: 40,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.cyan, borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Text(
                    'Log in',
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

  void _login() async {
    final email = _emailController.text;
    final pass = _passwordController.text;

    final success = await authService.logIn(email, pass);

    if(success){
      print("success");
      message = 'Đăng nhập thành công';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.5),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(40),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius .circular(50)
          ),
          content: Center(child: Text(message)),
          duration: Duration(seconds: 1), // Thời gian hiển thị của snackbar
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      print("Failed");
      message = 'Sai thông tin đăng nhập';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.5),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius .circular(50)
          ),
          content: Center(child: Text(message)),
          duration: Duration(seconds: 1), // Thời gian hiển thị của snackbar
        ),
      );
    }
  }

  void showPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onLoginClicked(){
    var isValid = bloc.isValidLogin(
        _emailController.text,
        _passwordController.text
        );
  }

}
