import 'package:flutter/material.dart';

import 'BottomNavigationBar.dart';
//import 'home_page.dart';
import 'dart:math' as math;

import 'payForForm.dart';
import 'reviewForm.dart';
import 'welcome.dart';
import 'applyNow.dart';

class MyApplication extends StatefulWidget {
  @override
  _MyApplicationState createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //  bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('My Application'),
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 1.0),
              MyCustomButton(
                icon: Transform.rotate(
                  angle: -math.pi,
                  child: Icon(
                    Icons.system_update_alt,
                    color: Colors.white,
                  ),
                ),
                lable: 'Review FORM',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewForm()),
                  );
                },
              ),
              MyCustomButton(
                icon: Transform.rotate(
                  angle: -math.pi,
                  child: Icon(
                    Icons.system_update_alt,
                    color: Colors.white,
                  ),
                ),
                lable: 'SUBMIT FORM',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PayForForm()),
                  );
                },
              ),
              MyCustomButton(
                icon: Transform.rotate(
                  angle: -math.pi,
                  child: Icon(
                    Icons.print,
                    color: Colors.white,
                  ),
                ),
                lable: 'PRINT FORM',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReviewForm()),
                  );
                },
              ),
              MyCustomButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                lable: 'EDIT FORM',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ApplyNow()),
                  );
                },
              ),
              MyCustomButton(
                icon: Icon(
                  Icons.credit_card,
                  color: Colors.white,
                ),
                lable: 'PAY FOR FORM',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PayForForm()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {

  MyCustomButton({this.lable, this.icon, this.onPressed});

  final lable;
  final icon;
  final onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 70.0,
      padding: EdgeInsets.all(10),
      child: FlatButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.blueGrey[900],
        onPressed: onPressed,
        icon: icon,
        label: Text(
          lable,
          //textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
