import 'package:flutter/material.dart';
import 'package:online_admissions3/services/auth.dart';
import 'applyNow.dart';
import 'customButton.dart';
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
        bottomNavigationBar: BottomNavBar(),
        body: Column(
          children: [
            Container(
              height: 200.0,
              //color: Colors.blueGrey[900],
              child: Stack(
                children: [
                  Container(
                    //color: Colors.blueGrey[900],
                    child: Column(
                      children: [
                        Container(
                          height: 100.0,
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
                    bottom: 50.0,
                    //left: 120,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/images/profile.jpg',
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
            CustomButton1(
                label: 'My Application',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApplication(),
                    ),
                  );
                }),
            CustomButton1(
              label: 'Apply Now',
              onPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ApplyNow(),
                  ),
                );
              },
            ),
            CustomButton1(
              label: 'Find School on map',
              onPress: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapsPage(),
                  ),
                );
              },
            ),
            CustomButton1(
              label: 'Settings',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Settings(),
                  ),
                );
              },
            ),
            CustomButton1(
              label: 'Logout',
              onPress: () async {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => HomePage(),
                //   ),
                // );

                await _auth.signOut();
              },
            ),
            
            SizedBox(height: 1.0),
          ],
        ),
      ),
    );
  }
}
