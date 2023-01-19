// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/Home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 70,
          child: Image.asset('assets/images/productarena.png'),
        ),
      ),
    );
  }
}
