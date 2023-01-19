import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nameController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;
  const SignupForm({
    Key? key,
    required this.confirmPasswordController,
    required this.confirmPasswordFocusNode,
    required this.emailController,
    required this.emailFocusNode,
    required this.formKey,
    required this.nameController,
    required this.passwordController,
    required this.passwordFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 18),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontSize: 20),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
              )),
              label: Text(
                'Korisničko ime',
              ),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(passwordFocusNode),
            keyboardType: TextInputType.name,
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Unesi ime';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 18),
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
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(confirmPasswordFocusNode),
            keyboardType: TextInputType.name,
            focusNode: passwordFocusNode,
            controller: passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Unesi šifru';
              }
              if (value.length < 6) {
                return 'Šifra mora imati najmanje 6 karaktera';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 18),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontSize: 20),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.black,
              )),
              label: Text(
                'Šifra ponovo',
              ),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(emailFocusNode),
            keyboardType: TextInputType.name,
            focusNode: confirmPasswordFocusNode,
            controller: confirmPasswordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Unesi šifru';
              }
              if (value != passwordController.text) {
                return 'Šifra se ne podudara';
              } else {
                return null;
              }
            },
          ),
          TextFormField(
            style: const TextStyle(color: Colors.black, fontSize: 18),
            decoration: const InputDecoration(
              labelStyle: TextStyle(fontSize: 20),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
              label: Text(
                'Email',
              ),
            ),
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            keyboardType: TextInputType.emailAddress,
            focusNode: emailFocusNode,
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
        ],
      ),
    );
  }
}
