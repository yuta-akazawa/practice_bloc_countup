import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:practice_bloc_cpuntup/minimum/view.dart';
import 'package:practice_bloc_cpuntup/schedule/schedule.dart';

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
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed:(){
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => MinimumStateless()
                    ),
                );
              },
              child: Text('最小のBloc'),
            ),
            SizedBox(height: 30,),
            RaisedButton(
              onPressed:(){
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => ScheduleStateless()
                  ),
                );
              },
              child: Text('スケジュール'),
            ),

          ],
        ),
      ),
    );
  }
}