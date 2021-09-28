import 'package:flutter/material.dart';

class RegisterController {
  late BuildContext context;

  Future? init( BuildContext context ){
    this.context = context;
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, 'login');
  }

  void submit() {

  }
}