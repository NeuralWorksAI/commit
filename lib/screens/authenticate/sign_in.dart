import 'package:commit/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    },
                  ),
                  ElevatedButton(
                    child: Text(
                      'Sign in',
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);
                        if (result == null) {
                          setState(() => error = 'please supply a valid email');
                        }
                      }
                    },
                  ),
                  SizedBox(height: 12.0),
                  Text(error),
                  ElevatedButton(
                    child: Text(
                      'Register',
                    ),
                    onPressed: () async {
                      widget.toggleView();
                    },
                  ),
                ],
              ),
            )));
  }
}
