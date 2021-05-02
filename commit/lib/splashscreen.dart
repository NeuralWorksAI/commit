import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customBottomNav.dart';
import 'my_flutter_app_icons.dart';
import 'dashboard.dart';

class Splash extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      home: SplashHome(),
      routes: <String, WidgetBuilder>{
        '/Dashboard': (context)=> Dashboard(),
      },
      
    );
  }
}

class SplashHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff324982),
        body: FlatButton(
          onPressed: () {
            Navigator.pushNamed(context,'/Dashboard');
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/splashLogo.png',
                  fit: BoxFit.contain,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text('COMMIT',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40)),
                ),
                Text('Peers-productivity App',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
        ),
      );
  }
}