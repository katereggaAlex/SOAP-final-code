import 'package:flutter/material.dart';
import 'package:online_admissions3/services/auth.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'loading.dart';
import 'login.dart';
//import 'package:online_admissions/settings.dart';

import 'BottomNavigationBar.dart';
import 'user-model.dart';
//import 'home_page.dart';
//import 'myApplication.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Text Field State
  String email = '';
  String password = '';
  String userName = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    //print("From Login Page # ${user.uid}");

    if (user == null) {
      return loading
          ? Loading()
          : Container(
              child: Center(
                child: Scaffold(
                  // bottomNavigationBar: BottomNavBar(),
                  appBar: AppBar(
                    backgroundColor: Colors.blueGrey[900],
                    title: Text('Welcome'),
                    //centerTitle: true,
                    actions: [
                      FlatButton.icon(
                        label: Text(
                          'Sign in',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: Icon(Icons.person, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
                      children: [
                        SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.insert_photo,
                                  size: 80.0,
                                ),
                                Text(
                                  'Profile Picture',
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Create Account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.blueGrey[900],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'All Fields are required',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blueGrey[900],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  validator: (_val) =>
                                      _val.isEmpty ? 'Enter an email' : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Email',
                                  ),
                                  onChanged: (_val) {
                                    setState(() {
                                      email = _val;
                                    });
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  validator: (_val) =>
                                      _val.isEmpty ? 'Enter Username' : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Username',
                                  ),
                                  onChanged: (_val) {
                                    setState(() {
                                      userName = _val;
                                    });
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  validator: (_val) => _val.length < 6
                                      ? 'Enter a password 6+ character long'
                                      : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Password',
                                  ),
                                  onChanged: (_val) {
                                    setState(() {
                                      password = _val;
                                    });
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  validator: (_val) => _val.length < 6
                                      ? 'Enter a password 6+ character long'
                                      : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter Password Again',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 70.0,
                          padding: EdgeInsets.all(10),
                          child: RawMaterialButton(
                              fillColor: Colors.blueGrey[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Login(),
                                  //   ),
                                  // );
                                  setState(() {
                                    loading = true;
                                  });
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);

                                  if (result == null) {
                                    setState(
                                      () {
                                        error = 'Please supply a valid email';

                                        loading = false;
                                      },
                                    );
                                  }
                                }
                              }),
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          error,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Already created account? ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login here',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        InkWell(
                          onTap: () async {
                            dynamic result = await _auth.signInAnon();
                            if (result == null) {
                              print('Error signing in');
                            } else {
                              print('Signed in');

                              print('Result ${result.uid}');
                            }
                          },
                          child: Text(
                            'Login Anonymously',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    } else {
      return HomePage();
    }
  }
}
