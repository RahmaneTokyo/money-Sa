import 'package:flutter/material.dart';
import 'package:moneysa/auth/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  // Splash Screen function with duration after then navigate to login page
  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold();
  }
}

