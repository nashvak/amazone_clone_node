// ignore_for_file: use_build_context_synchronously
import 'dart:convert';

import 'package:ecommerce_app/common/error_handling.dart';
import 'package:ecommerce_app/common/utils.dart';
import 'package:ecommerce_app/constants/global_variables.dart';
import 'package:ecommerce_app/user_panel/models/user_model.dart';
import 'package:ecommerce_app/user_panel/providers/auth/user_provider.dart';
import 'package:ecommerce_app/common/bottonbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class AuthService {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
        cart: [],
      );

      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
      );
      print(response.body);
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackbar(context,
                'Account Has Been Created You Can Login With Same Credentials');
          });
    } catch (e) {
      print('error occured');
      showSnackbar(context, e.toString());
    }
  }

  //  sign in user

  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({"email": email, "password": password}),
        headers: <String, String>{
          'Content-type': 'application/json;charset=UTF-8',
        },
      );
      print(response.body);
      httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            Provider.of<UserProvider>(context, listen: false)
                .setUser(response.body);
            await prefs.setString(
                'x-auth-token', jsonDecode(response.body)['token']);

            // showSnackbar(context, 'Login succesfully.!');
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {
      print('error occured');
      showSnackbar(context, e.toString());
    }
  }
}
