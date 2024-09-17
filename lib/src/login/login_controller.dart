import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController {
  BuildContext? context;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToRegisterPage() {
    Navigator.pushNamed(context!, 'register');
  }

  void login() {
    String email = emailcontroller.text.trim();
    String password = passwordcontroller.text.trim();

    print('EMail: $email y Password: $password');
  }
}
