import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService {
  static const String baseUrl = 'http://192.168.1.202:3000';

  Future<bool> signUp(String username, String email, String pass) async {

    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {'Content-Type' : 'application/json'},
      body: jsonEncode({
        'username': username,
        'email': email,
        'password': pass,
      })
    );

    if(response.statusCode == 201) {
      print("create acc success");
      return true;
    } else {
      print("create acc failed");
      return false;
    }
  }

  Future<bool> logIn(String email, String password) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users?email=$email&password=$password'),
    );

    if (response.statusCode == 200) {
      final List users = jsonDecode(response.body);


      // Tìm người dùng có email tương ứng
      var user = users.firstWhere((user) => user['email'] == email, orElse: () => null);

      if (user != null && user['password'] == password) {
        return true; // Đăng nhập thành công
      } else {
        return false; // Sai mật khẩu
      }



    } else {
      return false;
    }
  }

}