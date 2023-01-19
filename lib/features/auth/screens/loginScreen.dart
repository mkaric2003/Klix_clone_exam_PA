// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:pa_klix_exam/features/auth/widgets/loginForm.dart';
import 'package:pa_klix_exam/features/home/screens/homeScreen.dart';
import 'package:pa_klix_exam/services/auth_service.dart';
import 'package:pa_klix_exam/features/auth/screens/signupScreen.dart';
import 'package:pa_klix_exam/widget/customButton.dart';

class Login extends StatefulWidget {
  static const routeName = '/Login';
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService authService = AuthService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  void onSubmitLogin() async {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {
      _formKey.currentState!.save();
      signInUser();
    }
  }

  void signupNavigation() {
    setState(() {
      Navigator.of(context).pushNamed(SignupScreen.routeName);
    });
  }

  void signInUser() {
    authService.logInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PRIJAVA',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LoginForm(
                formKey: _formKey,
                emailController: emailController,
                passwordController: passwordController,
                passwordFocusNode: passwordFocusNode,
              ),
              const SizedBox(
                height: 30,
              ),
              //Log in button
              CustomButton(
                content: const Text(
                  'Prijavi se',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                buttonFunction: onSubmitLogin,
                color: const Color.fromARGB(255, 60, 38, 182),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Expanded(
                      child: Divider(
                    thickness: 1.0,
                    color: Colors.black26,
                    height: 36.0,
                  )),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 214, 214, 213),
                        shape: BoxShape.circle),
                    child: const Center(
                      child: Text(
                        'ili',
                        style: TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1.0,
                      color: Colors.black26,
                      height: 36.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              //Facebook button
              CustomButton(
                content: const Text(
                  'Facebook prijava',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
                buttonFunction: signupNavigation,
                color: const Color.fromARGB(255, 60, 38, 182),
              ),
              const SizedBox(
                height: 7,
              ),
              // Google button
              CustomButton(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/google.png',
                      height: 20,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    const Text(
                      'Google prijava',
                      style: TextStyle(fontSize: 18, color: Colors.black38),
                    ),
                  ],
                ),
                buttonFunction: () {},
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              // Registration button
              CustomButton(
                content: const Text(
                  'Registracija',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
                buttonFunction: signupNavigation,
                color: const Color.fromARGB(255, 235, 233, 233),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
