import 'package:flutter/material.dart';
import 'package:flutter_study_app/src/login/data/join_or_login.dart';
import 'package:flutter_study_app/src/login/screens/login.dart';
import 'package:flutter_study_app/src/randomlist/screens/random_list.dart';
import 'package:provider/provider.dart';

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
        home: ChangeNotifierProvider<JoinOrLogin>.value(
            value: JoinOrLogin(),
            child: AuthPage()));
  }
}
