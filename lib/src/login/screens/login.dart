import 'package:flutter/material.dart';
import 'package:flutter_study_app/src/helper/login_background.dart';
import 'package:flutter_study_app/src/login/data/join_or_login.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: <Widget>[
        CustomPaint(
          size: size,
          painter:
              LoginBackground(isJoin: Provider.of<JoinOrLogin>(context).isJoin),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _logoImage,
            Stack(
              // Form With Login Button
              children: <Widget>[
                _inputForm(size), //
                _authButton(size),
              ],
            ),
            Container(
              height: size.height * 0.1,
            ),
            Consumer<JoinOrLogin>(
              builder: (BuildContext context, JoinOrLogin joinOrLogin,
                      Widget child) =>
                  GestureDetector(
                      onTap: () {
                        joinOrLogin.toggle();
                      },
                      child: Text(joinOrLogin.isJoin
                          ? "Already Have an Account? Sign in"
                          : "Don't Have an Accout? "
                              "Create One")),
            ),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ]),
    );
  }

  Widget get _logoImage => Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 10),
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
          ),
        ),
      );

  Widget _authButton(Size size) => Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 5,
        child: SizedBox(
          height: 40,
          child: Consumer<JoinOrLogin>(
            builder: (context, joinOrLogin, child) => RaisedButton(
                child: Text(
                  joinOrLogin.isJoin ? "Join" : "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: joinOrLogin.isJoin ? Colors.red : Colors.blueAccent,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print("button pressed!!");
                  }
                }),
          ),
        ),
      );

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Pleas input correct Email.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "Email"),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Pleas input correct Password.";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  Consumer<JoinOrLogin>(
                    builder: (builder, value, child) => Opacity(
                        opacity: value.isJoin ? 0 : 1,
                        child: Text("Forget "
                            "Password")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
