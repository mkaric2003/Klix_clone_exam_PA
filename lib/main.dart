import 'package:flutter/material.dart';
import 'package:pa_klix_exam/homeScreen.dart';
import 'package:pa_klix_exam/features/auth/screens/loginScreen.dart';
import 'package:pa_klix_exam/features/auth/screens/signupScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: {
        Login.routeName: (context) => const Login(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
    );
  }
}
