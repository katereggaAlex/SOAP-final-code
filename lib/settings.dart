import 'package:flutter/material.dart';

import 'BottomNavigationBar.dart';
//import 'home_page.dart';
//import 'dart:math' as math;

import 'welcome.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
         bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('SETTINGS'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Welcome(),
                    ),
                  );
                }),
          ],
        ),
        body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 1.0),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Image.asset('lib/assets/images/profile.jpg')),
                    Container(
                      height: 140,
                      child: Column(
                        children: [
                          Expanded(
                            child: MyCustomButton(lable: 'EDIT PROFILE PHOTO'),
                          ),
                          Expanded(
                            child: MyCustomButton(lable: 'EDIT PROFILE NAME'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MyCustomButton(lable: 'Change Theme Color'),
              MyCustomButton(lable: 'Change Password'),
              MyCustomButton(lable: 'Change Font Style'),
              MyCustomButton(lable: 'Help'),
              MyCustomButton(lable: 'Invite Friend'),
              Expanded(
                child: SizedBox(
                  height: 10.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  

  MyCustomButton({this.lable});
final lable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 70.0,
      padding: EdgeInsets.all(10),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.blueGrey[900],
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        // color: Colors.transparent,
        onPressed: () {},

        child: Text(
          lable,
          //textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.blueGrey[900],
          ),
        ),
      ),
    );
  }
}
