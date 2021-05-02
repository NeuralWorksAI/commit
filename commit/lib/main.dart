import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'splashscreen.dart';
import 'my_flutter_app_icons.dart';
import 'createtask.dart';
import 'friendslist-friend.dart';


void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Splash();
  }
}