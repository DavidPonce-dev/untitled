import 'package:flutter/material.dart';
import 'package:untitled/src/login/login_page.dart';
import 'package:untitled/src/register/register_page.dart';
import 'package:untitled/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'delivery App flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      theme: ThemeData(
          primarySwatch: MyColors.primary,
          //fontFamily: 'NimbusSans'
      ),
      routes: {
        'login': (BuildContext context) => const LoginPage(),
        'register': (BuildContext context) => const RegisterPage()
      },
    );
  }
}
