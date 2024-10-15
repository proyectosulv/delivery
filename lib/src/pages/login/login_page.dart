import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:lottie/lottie.dart';
import 'package:delivery_flutter/utils/my_colors.dart';
import 'package:delivery_flutter/src/pages/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _controller = LoginController();

  @override
  void initState() {
    super.initState();
    //print("INIT STATE");
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      //print('SCHEDULLER BINDING');
      _controller.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    //print("METODO BUILD");

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: -100,
              left: -90,
              child: _circle(),
            ),
            Positioned(
              top: 60,
              left: 80,
              child: _textLogin(),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 150),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //_imageBanner(),
                    _lottieAnimation(),
                    _textFieldEmail(),
                    _textFieldPassword(),
                    _buttonLogin(),
                    _textDontHaveAccount()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textLogin() {
    return const Text(
      'LOGIN',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _circle() {
    return Container(
      width: 340,
      height: 230,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: MyColors.primaryColor,
      ),
    );
  }

  Widget _lottieAnimation() {
    return Container(
      margin: EdgeInsets.only(
        //top: 150,
        bottom: MediaQuery.of(context).size.height * 0.12,
      ),
      child: Lottie.asset(
        'assets/json/delivery2.json',
        width: 350,
        height: 250,
        fit: BoxFit.fill,
      ),
    );
  }

  // Widget _imageBanner() {
  //   return Container(
  //     margin: EdgeInsets.only(
  //       top: 100,
  //       bottom: MediaQuery.of(context).size.height * 0.16,
  //     ),
  //     child: Image.asset(
  //       'assets/img/delivery.png',
  //       width: 250,
  //       height: 250,
  //     ),
  //   );
  // }

  Widget _textFieldEmail() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _controller.emailcontroller,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electronico',
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.email,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldPassword() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryColorOpacity,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        controller: _controller.passwordcontroller,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'contraseña',
          hintStyle: TextStyle(
            color: MyColors.primaryColorDark,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(15),
          prefixIcon: Icon(
            Icons.lock,
            color: MyColors.primaryColor,
          ),
        ),
      ),
    );
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: _controller.login,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: const Text('INGRESAR'),
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta?',
        ),
        const SizedBox(width: 7),
        GestureDetector(
          onTap: _controller.goToRegisterPage,
          child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: MyColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
