import 'package:commit/customBottomNav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'customBottomNav.dart';
import 'my_flutter_app_icons.dart';

class ActivityTab extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ActivityPage(),
    );
  }
}

class ActivityPage extends StatefulWidget {
  ActivityPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List<CardView> cards = [
    new CardView(
        "assets/angel.png",
        "Angel Shah has just completed one of his task to “finish biology homework.",
        '4h'),
    new CardView(
        "assets/angel.png",
        "Angel Shah has just completed one of his task to “make a dinner.",
        '6h')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Image.asset(
                'assets/peace.png',
                fit: BoxFit.contain,
                height: 60,
              ),
            ),
            Container(
                padding: const EdgeInsets.fromLTRB(5,0,0,8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text('Activity'),
                  Text(
                    "See current activities of your\npartners to verify their work",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ]))
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: Container(
          child: new ListView(
        children: cards,
      )),
      bottomNavigationBar: CommitBottomNav(),
    );
  }
}

class CardView extends StatefulWidget {
  final String imageurl;
  final String cardMessage;
  final String cardTime;
  CardView(this.imageurl, this.cardMessage, this.cardTime);
  @override
  _CardViewState createState() {
    return _CardViewState();
  }
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          children: [
            Padding(padding: const EdgeInsets.all(10)),
            Image.asset(
              widget.imageurl,
              scale: 1,
            ),
            Expanded(
                child: Container(
                    margin: const EdgeInsets.only(
                        top: 20.0, right: 30.0, left: 20.0),
                    height: 60,
                    child: Text(
                      widget.cardMessage,
                      style: TextStyle(color: const Color(0xff324982)),
                    ))),
            Text(
              widget.cardTime,
              style: TextStyle(color: const Color(0xffDADADA)),
            ),
          ],
        ));
  }
}
