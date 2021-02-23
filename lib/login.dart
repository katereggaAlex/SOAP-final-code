import 'package:flutter/material.dart';
import 'package:online_admissions3/services/auth.dart';
import 'package:online_admissions3/user-model.dart';
import 'package:provider/provider.dart';
import 'loading.dart';
import 'welcome.dart';

import 'ForgetPassword.dart';
import 'home_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool value = true;
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // Text Field State
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  //GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    //print("From Login Page # ${user.uid}");

    if (user == null) {
      return loading
          ? Loading()
          : Container(
              //height: MediaQuery.of(context).size.height,
              child: Scaffold(
                resizeToAvoidBottomPadding: true,
                appBar: AppBar(
                  backgroundColor: Colors.blueGrey[900],
                  title: Text("Welcome"),
                  //centerTitle: true,
                  actions: [
                    FlatButton.icon(
                      label: Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: Icon(Icons.person, color: Colors.white),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Welcome(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                body: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Container(
                        height: 160.0,
                        //color: Colors.blueGrey[900],
                        child: Stack(
                          children: [
                            Container(

                                //color: Colors.blueGrey[900],
                                child: Column(
                              children: [
                                Container(
                                  height: 80.0,
                                  color: Colors.blueGrey[900],
                                ),
                                Container(
                                  height: 80.0,
                                  color: Colors.transparent,
                                ),
                              ],
                            )),
                            Positioned(
                              bottom: 40.0,
                              left: 100,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "lib/assets/images/logo.jpg",
                                    height: 90,
                                    width: 90,
                                  ),
                                  Text(
                                    "Apply for School",
                                    style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          //shrinkWrap: true,
                          children: [
                            TextFormField(
                              validator: (_val) =>
                                  _val.isEmpty ? "Enter valid email" : null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Email",
                              ),
                              onChanged: (_val) {
                                setState(() {
                                  email = _val;
                                });
                              },
                            ),
                            SizedBox(height: 10.0),
                            TextFormField(
                              validator: (_val) => _val.length < 6
                                  ? "Enter a password 6+ characcter long"
                                  : null,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Password",
                              ),
                              onChanged: (_val) {
                                setState(() {
                                  password = _val;
                                });
                              },
                            ),
                          ],
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
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => HomePage(),
                              //   ),
                              // );
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);

                              if (result == null) {
                                setState(() {
                                  error =
                                      'Could not sign in with those credentials';
                                  loading = false;
                                });
                              }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FlatButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Welcome(),
                                ),
                              );
                            },
                            child: Text(
                              "Create a new account",
                              style: TextStyle(
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              activeColor: Colors.blueGrey[900],
                              value: value,
                              onChanged: (valu) {
                                setState(() {
                                  value = !value;
                                });
                              }),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
    } else {
      return HomePage();
    }
  }
}
