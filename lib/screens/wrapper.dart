import 'package:commit/screens/authenticate/authentication.dart';
import 'package:commit/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate
    return Authenticate();
  }
}