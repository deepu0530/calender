// import 'package:example/main_single_without_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:jiffy/jiffy.dart';
import 'package:some_calendar/some_calendar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  DateTime selectedDate = DateTime.now();
  List<DateTime> selectedDates = [];
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
   initializeDateFormatting();
    Intl.systemLocale =
    'en_En'; // to change the calendar format based on localization
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Text(
                  'SomeCalendar Dialog',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Center(
                child: Text(
                  selectedDates.toString(),
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Multi"),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => SomeCalendar(
                            scrollDirection: Axis.horizontal,
                            mode: SomeMode.Multi,
                            startDate: Jiffy().subtract(years: 3),
                            lastDate: Jiffy().add(months: 9),
                            isWithoutDialog: false,
                            selectedDates: selectedDates,
                            labels: new Labels(
                              dialogDone: 'done',
                              dialogCancel: 'cancel',
                              dialogRangeFirstDate: 'Tanggal Pertama',
                              dialogRangeLastDate: 'Tanggal Terakhir',
                            ),
                            done: (date) {
                              setState(() {
                                selectedDates = date;
                                //showSnackbar(selectedDates.toString());
                              });
                            },
                          ));
                    },
                  ),

                ],
              ),
              SizedBox(
                height: 16,
              ),
                ],
              ),
          ),
        ),
    );
  }
}