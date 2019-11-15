import 'package:flutter/material.dart';
import 'package:flutter_study_app/src/login/login.dart';
import 'package:flutter_study_app/src/random_list.dart';

void main() => runApp(LoginApp());

class MyRandomListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RandomList(),
    );
  }
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage()
    );
  }
}
