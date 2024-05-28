// lib/presentation/screens/welcome/sign_up_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mind_twist/core/domain/user/user_failure.dart';
import 'package:mind_twist/presentation/screens/welcome/sign_up_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUp() async {
    emit(SignUpState.loading());

    try {
      final response = await http.post(
        Uri.parse('http://192.168.42.1:3000/api/auth/signup'),
        body: jsonEncode({
          'username': usernameController.text.trim(),
          'password': passwordController.text.trim(),
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        // Save the token and userId in shared preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', data['token']);
        prefs.setString('userId', data['userId']);

        emit(SignUpState.success());
      } else {
        final error = jsonDecode(response.body)['message'];
        emit(SignUpState.failure(UserFailure(message: error)));
      }
    } catch (error) {
      emit(SignUpState.failure(UserFailure(message: 'An error occurred')));
    }
  }
}
