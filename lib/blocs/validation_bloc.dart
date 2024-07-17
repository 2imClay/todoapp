import 'dart:async';
import 'package:todo_appv1/validators/validations.dart';

class ValidationBloc {
  final _userController = StreamController.broadcast();
  final _passController = StreamController.broadcast();
  final _emailController = StreamController.broadcast();


  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;
  Stream get emailStream => _emailController.stream;

  bool isValidSignUp(String username, String pass, String email) {
    if(!Validations.isValidUser(username)) {
      _userController.sink.addError("Tên tài khoản không hợp lệ ");
      return false;
    }
    _userController.sink.add("OK");
    if(!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu phải nhiều hơn 8 ký tự");
      return false;
    }
    _passController.sink.add("OK");
    if(!Validations.isValidEmail(email)) {
      _emailController.sink.addError("Email không hợp lệ");
      return false;
    }
    _emailController.sink.add("OK");

    return true;
  }

  bool isValidLogin(String email, String pass) {
    if(!Validations.isValidEmail(email)) {
      _emailController.sink.addError("Email không hợp lệ");
      return false;
    }
    _emailController.sink.add("OK");
    if(!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu không hợp lệ");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }
  bool isValidInforLogin(String email, String pass) {
    if(!Validations.isValidEmail(email)) {
      _emailController.sink.addError("Email không tồn tại");
      return false;
    }
    _emailController.sink.add("OK");
    if(!Validations.isValidPass(pass)) {
      _passController.sink.addError("Mật khẩu sai");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }

  void dispose(){
    _userController.close();
    _passController.close();
    _emailController.close();
  }
}