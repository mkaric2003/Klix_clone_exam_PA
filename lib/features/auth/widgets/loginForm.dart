// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode passwordFocusNode;
  final GlobalKey formKey;
  const LoginForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.passwordFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 18),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontSize: 20),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
              )),
              label: Text(
                'Email',
              ),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(passwordFocusNode),
            keyboardType: TextInputType.name,
            controller: emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Unesi email';
              }
              if (!value.contains('@') || !value.endsWith('.com')) {
                return 'Unesi ispravan email';
              } else {
                return null;
              }
            },
          ),
          const SizedBox(height: 5),
          TextFormField(
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontSize: 20),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
              )),
              label: Text(
                'Šifra',
              ),
            ),
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.name,
            controller: passwordController,
            focusNode: passwordFocusNode,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Unesi šifru';
              }
              if (value.length < 6) {
                return 'Šifra mora sadržavati najmanje 6 karaktera';
              } else {
                return null;
              }
            },
          ),
        ],
      ),
    );
  }
}
