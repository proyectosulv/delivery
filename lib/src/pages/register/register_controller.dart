import 'package:delivery_flutter/src/models/response_api.dart';
import 'package:delivery_flutter/src/models/user_model.dart';
import 'package:delivery_flutter/src/services/user_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterController {
  BuildContext? context;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UserService userService = UserService();

  Future? init(BuildContext context) {
    this.context = context;
  }

  void goToLoginPage() {
    //Navigator.pushNamed(context!, 'Home');
    Navigator.pop(context!);
  }

  void register() async {
    String email = emailController.text.trim();
    String name = nameController.text.trim();
    String lastname = lastNameController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    User user = User(
      email: email,
      name: name,
      lastName: lastname,
      phone: phone,
      password: password,
    );

    ResponseApi responseApi = await userService.create(user);

    print('RESPUESTA: ${responseApi.toJson()}');

    // print('EMail: $email');
    // print('Name: $name');
    // print('LastName: $lastname');
    // print('Phone: $phone');
    // print('Password: $password');
    // print('Confirm Password: $confirmPassword');
  }
}
