import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customBottomNav.dart';

void main() {
  runApp(Friends());
}

class Friends extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FriendsPage(),
    );
  }
}

class FriendsPage extends StatefulWidget {
  FriendsPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  List<FriendList> friends = [
    new FriendList("assets/angel.png", "Angel", "9/10"),
    new FriendList("assets/michael.png", "Micheal", "7/10"),
    new FriendList("assets/piyush.png", "Piyush", "10/10"),
  ];
  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/searching.png',
              fit: BoxFit.contain,
              height: 90,
            ),
            Container(
                child: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text('Friends List'),
                      ),
                      Container(
                        width: c_width,
                        child: Text(
                          "Your friends here will verify your\nwork (accountability partner)",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.normal),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ]),
              ),
            ))
          ],
        ),
        toolbarHeight: 100.0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 85,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 1.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                      ),
                      hintText: 'Search by username or email',
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 15,
                    child: Container(
                      height: 45,
                      child: FittedBox(
                        child: FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.add),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ButtonTheme(
                  minWidth: 30,
                  child: FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: Text(
                      " Friends ",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.blue,
                    shape: Border(
                        bottom: BorderSide(color: Colors.blue, width: 3)),
                  ),
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Request"),
                  color: Colors.transparent,
                  // shape: Border(
                  //           bottom: BorderSide(color: Colors.black, width: 3)
                  //         ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
                child: new ListView(
              children: friends,
            )),
          ),
        ],
      ),
      bottomNavigationBar: CommitBottomNav(),
    );
  }
}

//---------------------------------------------------------------------------------------
//

class FriendList extends StatefulWidget {
  final String imgURL;
  final String name;
  final String completionTask;

  FriendList(this.imgURL, this.name, this.completionTask);
  @override
  _FriendListState createState() {
    return _FriendListState();
  }
}

class _FriendListState extends State<FriendList> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7.0),
        side: BorderSide(color: Colors.white, width: 1),
      ),
      child: Row(
        children: [
          Image.asset(
            widget.imgURL,
            height: 100,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: const Color(0xff324982)),
              ),
              Text(
                "Completion Task: " + widget.completionTask,
                style: TextStyle(fontSize: 15, color: const Color(0xff324982)),
              )
            ],
          )
        ],
      ),
    );
  }
}
