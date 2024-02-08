import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:netflix_clone/app/core/constants.dart';
import 'package:netflix_clone/app/models/user.dart';

class UserService{
  static Future<User> getUser(String enteredEmail, String enteredPassword) async {
    final dio = Dio();
    final response = await dio.get('${Constants.baseServerUrl}/users?email=$enteredEmail&password=$enteredPassword');

    return User(
      username: response.data[0]["username"],
      email: response.data[0]["email"],
      password: response.data[0]["password"],
      privacy: response.data[0]["privacy"],
      id: response.data[0]["id"]
    );
  }

  static Future<void> postUser(String enteredUsername, String enteredEmail, String enteredPassword) async {
    final dio = Dio();
    final response = await dio.post(
        '${Constants.baseServerUrl}/users',
      data: {
          'username': enteredUsername,
          'email': enteredEmail,
          'password': enteredPassword,
          'privacy': true
      }
    );
  }
}