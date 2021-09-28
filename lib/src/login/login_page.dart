// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled/utils/my_colors.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // ignore: prefer_final_fields
  LoginController _com = LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) => {
      _com.init(context)
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -80,
                child: _CircleLogin()
            ),
            Positioned(
                top: 70,
                left: 40,
                child: _TextLogin()
            ),
            Column (
              children: [
                _LottieAnimation(context),
                _Input(Icons.email, 'Correo Electronico'),
                _Input(Icons.lock, 'Contraseña'),
                _ButtonLogin(),
                _DontHaveAnAccount(context)

              ],
            ),
          ],
        ),

      )
    );
  }
  Widget _TextLogin () => const Text(
    'LOGIN',
    style: TextStyle(
        fontFamily: 'NimbusSans',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22
    ),
  );

  Widget _CircleLogin() => Container(
    width: 240,
    height: 240,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: MyColors.primary,
    ),
  );

  Widget _LottieAnimation (BuildContext context) => Container(
    margin: EdgeInsets.only(
        top:100,
        bottom: MediaQuery.of(context).size.height * 0.1
    ),
    child: Lottie.asset(
        'assets/json/delivery.json',
        width: 350,
        height: 250,
        fit: BoxFit.fill
    ),
  );


  Widget _Input (IconData prefixIcon, String hint) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
    decoration: BoxDecoration(
        color: MyColors.primary.shade50,
        borderRadius: BorderRadius.circular(30)
    ),
    child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            prefixIcon: Icon(prefixIcon),
            hintStyle: TextStyle(
                color: MyColors.primary.shade900
            )
        )
    ),
  );

  Widget _ButtonLogin () => Container(
    width:  double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
    child:   ElevatedButton(
      onPressed: () {  },
      child: const Text('INGRESAR'),
      style: ElevatedButton.styleFrom(
          primary: MyColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15)
      ),
    ),
  );

  Widget _DontHaveAnAccount (BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
          'No tienes cuenta?',
          style: TextStyle(
              color: MyColors.primary
          )
      ),
      const SizedBox(width: 7),
      GestureDetector(
        onTap: _com.goToRegisterPage,
        child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primary
            )
        ),
      ),
    ],
  );
}
