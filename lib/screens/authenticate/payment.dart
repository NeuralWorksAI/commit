import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_flutter_app_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/pd.png',
              fit: BoxFit.contain,
              height: 60,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Enter Payment Details'))
          ],
        ),
        toolbarHeight: 80.0,
      ),
      body: MyCustomForm(),
      bottomNavigationBar: BottomNavigationBar(
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
          elevation: 5),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "\n\n Email\n",
            style: TextStyle(
              color: const Color(0xff324982),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Text(
            "\nSave Card Information",
            style: TextStyle(
              color: const Color(0xff324982),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\n Card Information\n",
            style: TextStyle(
              color: const Color(0xff324982),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: '1231  1234 1234 1241',
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Text('\n'),
          Row(children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'MM/YY',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'CVC',
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
              ),
            )
          ]),
          Text(
            '\n Name on Card\n',
            style: TextStyle(
              color: const Color(0xff324982),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Text(
            '\n Country or region\n',
            style: TextStyle(
              color: const Color(0xff324982),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Text('\n'),
          new Container(
              height: 40.0,
              width: 360.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              margin: new EdgeInsets.symmetric(horizontal: 20.0),
              child: new RaisedButton(
                disabledColor: Colors.transparent,
                onPressed: null,
                child: const Text(
                  'Save Card',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
