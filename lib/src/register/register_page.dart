// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:untitled/src/register/register_controller.dart';
import 'package:untitled/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final RegisterController _com = RegisterController();
  
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
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -80,
                child: _CircleRegister()
            ),
            Positioned(
                top: 70,
                left: 40,
                child: _TextRegister()
            ),
            SizedBox(
              width: double.infinity,
              child: Column (
                children: [
                  _RegisterAvatar(),
                  _Input(Icons.email_outlined, 'Correo Electronico'),
                  _Input(Icons.person, 'Nombre'),
                  _Input(Icons.person_outline, 'Apellido'),
                  _Input(Icons.phone, 'Telefono'),
                  _Input(Icons.lock_outline, 'Contraseña'),
                  _Input(Icons.lock, 'Confirmar ontraseña'),
                  _ButtonRegister(),
                ],
              )
            )
          ],
        ),

      )
    );
  }

  Widget _RegisterAvatar () => Container(
    margin: const EdgeInsets.only(top: 120, bottom: 30),
    child: const CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      backgroundColor: Colors.white,
      radius: 60,
    )
  );

  Widget _TextRegister () => const Text(
    'Registro',
    style: TextStyle(
        fontFamily: 'NimbusSans',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22
    ),
  );

  Widget _CircleRegister() => Container(
    width: 240,
    height: 240,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: MyColors.primary,
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

  Widget _ButtonRegister () => Container(
    width:  double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
    child:   ElevatedButton(
      onPressed: _com.submit,
      child: const Text('Registrarse'),
      style: ElevatedButton.styleFrom(
          primary: MyColors.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          padding: const EdgeInsets.symmetric(vertical: 15)
      ),
    ),
  );
}