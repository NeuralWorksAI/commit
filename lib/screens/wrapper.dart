import 'package:commit/models/user.dart';
import 'package:commit/screens/authenticate/authentication.dart';
import 'package:commit/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    //return either home or authenticate
  }
}
