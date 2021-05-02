import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customBottomNav.dart';
import 'createtask.dart';
import 'friendslist-friend.dart';
import 'activity.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
      // initialRoute:'/',
      routes: <String, WidgetBuilder>{
        // '/': (context)=> DashboardScreen(),
        '/AddTask': (context) => CreateTask(),
        '/ActivityPage': (context) => ActivityPage(),
        '/FriendsPage': (context) => FriendsPage(),
      },
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

List<TaskList> tasks = [
  new TaskList("Write a blog post.", true),
  new TaskList("Do Econ 210 homework.", true),
  new TaskList("Make pasta for dinner.", false),
];

class _DashboardScreenState extends State<DashboardScreen> {
  var _drawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
        bottomNavigationBar: CommitBottomNav(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: IconButton(
                  onPressed: () {
                    _drawerKey.currentState.openDrawer();
                  },
                  icon: Icon(Icons.menu, size: 35)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/dashboardCalendar.png',
                  width: 320,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonTheme(
                  minWidth: 30,
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Text(
                      " Active ",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.blue,
                    shape: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3)),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Completed"),
                  color: Colors.transparent,
                  // shape: Border(
                  //           bottom: BorderSide(color: Colors.black, width: 3)
                  //         ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/AddTask');
                  },
                  child: Text(
                    "Add a task",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                  child: new ListView(
                children: tasks,
              )),
            ),
          ],
        ),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Image.asset(
                      'assets/angel.png',
                      scale: 0.7,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      "Angel Shah",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: const Color(0xff324982),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )));
  }
}

//---------------------------------------------------------------------------------------
//

class TaskList extends StatefulWidget {
  final String taskDesc;
  bool isDone;

  TaskList(this.taskDesc, this.isDone);
  @override
  _TaskListState createState() {
    return _TaskListState();
  }
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff324982),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Expanded(
                  child: Text(
                widget.taskDesc,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          Theme(
            data: ThemeData(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              checkColor: Colors.greenAccent,
              activeColor: Colors.white,
              value: widget.isDone,
              onChanged: (bool value) {
                setState(() {
                  widget.isDone = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
