import 'package:flutter/material.dart';
import 'package:online_admissions3/services/auth.dart';
import 'applyNow.dart';
import 'settings.dart';

import 'BottomNavigationBar.dart';
import 'myApplication.dart';
import 'maps_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final AuthService _auth = AuthService();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // bottomNavigationBar: BottomNavBar(),
        body: Column(
          children: [
            Container(
              height: 300.0,
              //color: Colors.blueGrey[900],
              child: Stack(
                children: [
                  Container(
                    //color: Colors.blueGrey[900],
                    child: Column(
                      children: [
                        Container(
                          height: 130.0,
                          color: Colors.blueGrey[900],
                        ),
                        Container(
                          height: 100.0,
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 120.0,
                    //left: 120,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "lib/assets/images/profile.jpg",
                          height: 90,
                          width: 90,
                        ),
                        // Text(
                        //   "Apply for School",
                        //   style: TextStyle(
                        //       color: Colors.blueGrey[900],
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 20.0),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.0),
            Container(
              width: 250,
              height: 70.0,
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
                  fillColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "My Application",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApplication(),
                      ),
                    );
                  }),
            ),
            Container(
              width: 250,
              height: 70.0,
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
                  fillColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Apply Now",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ApplyNow(),
                      ),
                    );
                  }),
            ),
            Container(
              width: 250,
              height: 70.0,
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
                  fillColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Find School on map",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MapsPage(),
                      ),
                    );
                  }),
            ),
            Container(
              width: 250,
              height: 70.0,
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
                  fillColor: Colors.blueGrey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Settings",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Settings(),
                      ),
                    );
                  }),
            ),
            Container(
              width: 250,
              height: 70.0,
              padding: EdgeInsets.all(10),
              child: RawMaterialButton(
                fillColor: Colors.blueGrey[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomePage(),
                  //   ),
                  // );

                  await _auth.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
