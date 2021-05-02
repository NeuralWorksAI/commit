import 'package:flutter/material.dart';
import 'my_flutter_app_icons.dart';
import 'friendslist-friend.dart';
import 'activity.dart';
import 'dashboard.dart';

class CommitBottomNav extends StatefulWidget {
  @override
  _CommitBottomNavState createState() => _CommitBottomNavState();
}

class _CommitBottomNavState extends State<CommitBottomNav> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(MyFlutterApp.friends),
              label: 'Friends',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 30),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(MyFlutterApp.activity),
            label: 'Activity',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0) {
              Navigator.pushNamed(context, '/FriendsPage');
            }
            if (index == 1) {
              // Navigator.pushNamed(context, '/');
              Navigator.popUntil(context,ModalRoute.withName(Navigator.defaultRouteName));
            }
            if (index == 2) {
              Navigator.pushNamed(context, '/ActivityPage');
            }
            print(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        // currentIndex: _selectedIndex,
        //selectedItemColor: Colors.black,
        iconSize: 20,
        //onTap: _onItemTapped,
        elevation: 5);
  }
}
