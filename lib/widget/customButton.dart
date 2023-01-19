// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final Function buttonFunction;
  final Widget content;

  const CustomButton({
    Key? key,
    required this.content,
    required this.buttonFunction,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: 5,
          minimumSize: Size(MediaQuery.of(context).size.width, 39),
        ),
        onPressed: () {
          buttonFunction();
        },
        child: content);
  }
}
