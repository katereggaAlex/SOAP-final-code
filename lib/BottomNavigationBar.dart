import 'package:flutter/material.dart';

import 'home_page.dart';
//import 'myApplication.dart';
import 'settings.dart';
import 'welcome.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  bool value = true;

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print(index);
      if (index == 0) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Welcome()));
      } else if (index == 1) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 2) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Settings()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTabTapped, // new
      currentIndex: _currentIndex, // new
      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home', style: TextStyle(color: Colors.blueGrey[900])),
          backgroundColor: Colors.blueGrey[900],
          activeIcon: Icon(
            Icons.home,
            color: Colors.blueGrey[900],
          ),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          title: Text('Application'),
        ),
        new BottomNavigationBarItem(
            icon: Icon(Icons.person), title: Text('Account'))
      ],
    );
  }
}
