import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: Stack(alignment: Alignment.center, children: <Widget>[
        Container(
          color: Colors.white,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
            Stack(
              // Form With Login Button
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(size.width * 0.05),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 6,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 12, bottom: 32),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                controller: _emailController,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.account_circle),
                                    labelText: "Email"),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Pleas input correct Email.";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              TextFormField(
                                controller: _passwordController,
                                decoration: InputDecoration(
                                    icon: Icon(Icons.vpn_key),
                                    labelText: "Email"),
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
                              Text("Forget Password"),
                            ],
                          )),
                    ),
                  ),
                ),
                //
                // Container(
//                  width: 100,
//                  height: 50,
//                  color: Colors.black,
//                ),
              ],
            ),
            Container(
              height: size.height * 0.1,
            ),
            Text("Don't Have an Accout? Create One"),
            Container(
              height: size.height * 0.05,
            )
          ],
        )
      ]),
    );
  }
}
