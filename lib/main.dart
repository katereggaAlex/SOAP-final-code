import 'package:flutter/material.dart';
import 'package:online_admissions3/services/auth.dart';
import 'package:online_admissions3/user-model.dart';
import 'package:provider/provider.dart';
import 'welcome.dart';
//import 'home_page.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Welcome(),
      ),
    );
  }
}
