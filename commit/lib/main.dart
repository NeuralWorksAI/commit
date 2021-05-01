import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'my_flutter_app_icons.dart';

void main() {
  runApp(Create_Task());
}

class Create_Task extends StatelessWidget {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/announcment.png',
              fit: BoxFit.contain,
              height: 60,
            ),
            Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Text('Create a new task'),
                  Text(
                    "Set the goal, and commit!",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ]))
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
  String _setTime, _setDate;

  String _hour, _minute, _time;

  String dateTime;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        selectedDate = picked;
        _dateController.text = DateFormat.yMd().format(selectedDate);
      });
  }

  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
        _hour = selectedTime.hour.toString();
        _minute = selectedTime.minute.toString();
        _time = _hour + ' : ' + _minute;
        _timeController.text = _time;
        _timeController.text = formatDate(
            DateTime(2019, 08, 1, selectedTime.hour, selectedTime.minute),
            [hh, ':', nn, " ", am]).toString();
      });
  }

  @override
  void initState() {
    _dateController.text = DateFormat.yMd().format(DateTime.now());

    _timeController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "\n\n Name of task \n",
            style: TextStyle(
              color: const Color(0xff324982),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            maxLines: 1,
            decoration: const InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                '\nI commit to ',
                style: TextStyle(
                    color: const Color(0xff324982),
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\n(500 characters max)',
                style: TextStyle(
                    color: const Color(0xff324982),
                    fontWeight: FontWeight.normal),
              ),
            ],
          ),
          Text('\n'),
          TextFormField(
            maxLines: 5,
            decoration: const InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
            ),
          ),
          Text('\n'),
          Text(
            '\n Deadline \n',
            style: TextStyle(
                color: const Color(0xff324982), fontWeight: FontWeight.bold),
          ),
          Row(children: [
            InkWell(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                width: 150,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _dateController,
                  onSaved: (String val) {
                    _setDate = val;
                  },
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _selectTime(context);
              },
              child: Container(
                width: 120,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  onSaved: (String val) {
                    _setTime = val;
                  },
                  enabled: false,
                  keyboardType: TextInputType.text,
                  controller: _timeController,

                  // labelText: 'Time',
                ),
              ),
            )
          ]),
          Text(
            '\n Stake \n',
            style: TextStyle(
                color: const Color(0xff324982), fontWeight: FontWeight.bold),
          ),
          Row(children: [
            Container(
              width: 80,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
            ),
            Text(
              "\$",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ]),
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
              child: new ElevatedButton(
                onPressed: null,
                child: const Text(
                  'Commit',
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
