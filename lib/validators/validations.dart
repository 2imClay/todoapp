class Validations {
  static bool isValidUser(String username) {
    return username != null && username.length >= 8;
  }
  static bool isValidPass(String pass) {
    return pass != null && pass.length >= 8;
  }
  static bool isValidEmail(String email){
    return email != null && email.contains("@gmail.com");
  }
}