import 'dart:async';
import 'package:flutter/material.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {
const SplashScreen({super.key});


@override
State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {
@override
void initState() {
super.initState();
Timer(const Duration(seconds: 3), () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (_) => const LoginScreen()),
  );
});
}


@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color.fromARGB(255, 0, 8, 122),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Image.asset('lib/assets/uimgb.png', height: 250, width: 250),
const SizedBox(height: 20),
],
),
),
);
}
}