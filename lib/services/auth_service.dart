// ignore_for_file: depend_on_referenced_packages, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pa_klix_exam/common/widgets/error_handling.dart';
import 'package:pa_klix_exam/features/home/screens/homeScreen.dart';
import 'package:pa_klix_exam/models/user.dart';
import 'package:pa_klix_exam/common/widgets/snackbar.dart';

String uri = 'http://139.144.178.75:5000';

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        fullname: name,
        email: email,
        password: password,
      );

      http.Response res = await http.post(
        Uri.parse('$uri/api/register'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
              context, 'Account created! Login with the same credentials!');
        },
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void logInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await http.post(
        Uri.parse('$uri/api/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
