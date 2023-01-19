// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pa_klix_exam/features/auth/widgets/signupForm.dart';
import 'package:pa_klix_exam/homeScreen.dart';
import 'package:pa_klix_exam/services/auth_service.dart';

enum Spol {
  man,
  woman,
}

class SignupScreen extends StatefulWidget {
  static const routeName = '/Signup';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final AuthService authService = AuthService();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool man = true;
  bool women = false;
  Spol _spol = Spol.man;

  void onSubmitSignup() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      });
    }
  }

  void signUpUser() {
    authService.signUpUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
    );
  }

  void checkSpol() {
    setState(() {
      man = !women;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
        title: const Text('Registracija',
            style: TextStyle(color: Colors.black54, fontSize: 21)),
        actions: [
          TextButton(
            onPressed: () {
              signUpUser();
            },
            child: const Text(
              'GOTOVO',
              style: TextStyle(color: Colors.black54, fontSize: 17),
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            SignupForm(
              confirmPasswordController: confirmPasswordController,
              confirmPasswordFocusNode: confirmPasswordFocusNode,
              emailController: emailController,
              emailFocusNode: emailFocusNode,
              formKey: _formKey,
              nameController: nameController,
              passwordController: passwordController,
              passwordFocusNode: passwordFocusNode,
            ),
            Row(
              children: <Widget>[
                const Text(
                  'Spol',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                Radio(
                  value: Spol.man,
                  groupValue: _spol,
                  onChanged: ((Spol? value) => setState(() {
                        _spol = value!;
                      })),
                ),
                const Text(
                  'Muško',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  width: 25,
                ),
                Radio(
                  value: Spol.woman,
                  groupValue: _spol,
                  onChanged: ((Spol? value) => setState(() {
                        _spol = value!;
                      })),
                ),
                const Text(
                  'Žensko',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
