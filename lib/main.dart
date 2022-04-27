import 'package:code_factory/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CodeFactory',
      theme: ThemeData(
        fontFamily: 'Rubik',
      ),
      home: const SplashScreen(),
    );
  }
}
