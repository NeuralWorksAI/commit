import 'package:flutter/material.dart';
import '../../components/my_flutter_app_icons.dart';


class CommitBottomNav extends StatefulWidget {
  @override
  _CommitBottomNavState createState() => _CommitBottomNavState();
}

class _CommitBottomNavState extends State<CommitBottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.friends),
              label: 'Friends',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.home),
              label: ' ',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.activity),
            label: 'Activity',
            backgroundColor: Colors.white,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        // currentIndex: _selectedIndex,
        //selectedItemColor: Colors.black,
        iconSize: 20,
        //onTap: _onItemTapped,
        elevation: 5);
  }
}
