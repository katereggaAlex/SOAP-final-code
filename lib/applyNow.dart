import 'package:flutter/material.dart';
import 'package:online_admissions3/loading.dart';
import 'package:provider/provider.dart';
//import 'package:online_admissions/login.dart';
//import 'home_page.dart';
//import 'male_female_model.dart';
import 'services/database.dart';
import 'user-model.dart';
import 'welcome.dart';

class ApplyNow extends StatefulWidget {
  @override
  _ApplyNowState createState() => _ApplyNowState();
}

class _ApplyNowState extends State<ApplyNow> {
  final _formKey = GlobalKey<FormState>();

  bool value = true;
  bool male = true;
  bool female = false;
  bool primary = true;
  bool olevel = false;
  bool alevel = true;
  bool disablityYes = false;
  bool disablityNo = true;
  bool terms = false;
  String _currentSugars;
  //String _currentName;
  //String _currentStrength;

  String _firstName;
  String _middleName;
  String _lastName;
  String _address;
  String _nationality;
  String _residence;
  String _email;
  String _mobileNum;
  String _disability;
  bool _checkBoxValue;
  int _male_female = 1;
  String _gender;
  String _parent_name;
  String _parent_email;
  String _parent_phone1;
  String _parent_phone2;
  String _parent_city;
  String _parent_country;
  String _parent_nin;
  String _parent_nationality;
  String _former_school;
  String _former_class;

  List<String> classes = [
    'Select',
    'P.1',
    'P.2',
    'P.3',
    'P.4',
    'P.5',
    'P.6',
    'P.7'
  ];
  List<String> schools = [
    'Select',
    'Nansana',
    'Kasubi',
    'Wakiso',
    'Kampala',
    'Makindye',
    'Kazo'
  ];
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            return Container(
              child: Center(
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.blueGrey[900],
                    title: Text('HOME'),
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
                  body: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: Column(
                              children: [
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Please choose the level you are applying for.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.blueGrey[900],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    FlatButton(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: primary
                                              ? Colors.transparent
                                              : Colors.red,
                                        ),
                                      ),
                                      color: primary
                                          ? Colors.blueGrey[900]
                                          : Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          primary = !primary;
                                          olevel = true;
                                          alevel = true;
                                        });
                                      },
                                      child: Text(
                                        'PRIMARY',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueGrey[100],
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: olevel
                                              ? Colors.transparent
                                              : Colors.red,
                                        ),
                                      ),
                                      color: olevel
                                          ? Colors.blueGrey[900]
                                          : Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          olevel = !olevel;
                                          primary = true;
                                          alevel = true;
                                        });
                                      },
                                      child: Text(
                                        'O LEVEL',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueGrey[100],
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                      shape: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: alevel
                                              ? Colors.transparent
                                              : Colors.red,
                                        ),
                                      ),
                                      color: alevel
                                          ? Colors.blueGrey[900]
                                          : Colors.red,
                                      onPressed: () {
                                        setState(() {
                                          alevel = !alevel;
                                          primary = true;
                                          olevel = true;
                                        });
                                      },
                                      child: Text(
                                        'A LEVEL',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blueGrey[100],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),

                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  value: _currentSugars ?? 'Select',
                                  items: classes.map(
                                    (myclass) {
                                      return DropdownMenuItem(
                                        value: myclass,
                                        child: Text('$myclass Class'),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (sugar) {
                                    _currentSugars = sugar;
                                  },
                                ),
                                // Container(
                                //   width: 200.0,
                                //   height: 50.0,
                                //   alignment: Alignment.topLeft,
                                //   decoration: BoxDecoration(
                                //       //shape: BoxShape.circle,
                                //       borderRadius: BorderRadius.circular(10.0),
                                //       border: Border.all(
                                //           color: Colors.blueGrey[900])
                                //       //color:Colors.blueGrey[900],
                                //       ),
                                //   child: ListTile(
                                //     title: Text("SELECT CLASS",
                                //         style: TextStyle(
                                //           color: Colors.blueGrey[900],
                                //         )),
                                //     trailing: Icon(
                                //       Icons.arrow_drop_down,
                                //       color: Colors.blueGrey[900],
                                //     ),
                                //   ),
                                // ),

                                SizedBox(height: 10.0),
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        'Please select the school of your choice.')),
                                SizedBox(height: 10.0),

//===================== SELECT SCHOOL =============================
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                  value: _currentSugars ?? 'Select',
                                  items: schools.map(
                                    (mySchool) {
                                      return DropdownMenuItem(
                                        value: mySchool,
                                        child: Text('$mySchool School'),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (sugar) {
                                    _currentSugars = sugar;
                                  },
                                ),
                                // Container(
                                //   width: 200.0,
                                //   height: 50.0,
                                //   decoration: BoxDecoration(
                                //       //shape: BoxShape.circle,
                                //       borderRadius: BorderRadius.circular(10.0),
                                //       border: Border.all(
                                //           color: Colors.blueGrey[900])
                                //       //color:Colors.blueGrey[900],
                                //       ),
                                //   child: ListTile(
                                //     title: Text("SELECT SCHOOL",
                                //         style: TextStyle(
                                //           color: Colors.blueGrey[900],
                                //         )),
                                //     trailing: Icon(
                                //       Icons.arrow_drop_down,
                                //       color: Colors.blueGrey[900],
                                //     ),
                                //   ),
                                // ),

                                SizedBox(height: 10.0),
                                Text(
                                  'APPLICATION FOR ADMISSION',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SECTION 1: STUDENTS DETAILS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.firstName,
                                  validator: (_val) =>
                                      _val.isEmpty ? 'Enter valid email' : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'First Name',
                                  ),
                                  onChanged: (_val) {
                                    _firstName = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.middleName,
                                  validator: (_val) => _val.isEmpty
                                      ? 'Enter valid Middle name'
                                      : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Middle Name',
                                  ),
                                  onChanged: (_val) {
                                    _middleName = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.lastName,
                                  validator: (_val) => _val.isEmpty
                                      ? 'Enter valid Last Name'
                                      : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Last Name',
                                  ),
                                  onChanged: (_val) {
                                    _lastName = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text('Date of Birth*'),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  //width: 200.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      //shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(
                                          color: Colors.blueGrey[900])
                                      //color:Colors.blueGrey[900],
                                      ),
                                  child: ListTile(
                                    title: Text(
                                      '12 May 1998',
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                      ),
                                    ),
                                    trailing: Icon(
                                      Icons.calendar_today,
                                      color: Colors.blueGrey[900],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Gender*',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 300.0,
                                  height: 60.0,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: RadioListTile(
                                            value: 1,
                                            title: Text('Male'),
                                            groupValue: _male_female,
                                            onChanged: (_value) {
                                              setState(() {
                                                print(_value);

                                                _male_female = _value;
                                                _gender = 'male';
                                              });
                                            }),
                                      ),
                                      Expanded(
                                        child: RadioListTile(
                                            value: 2,
                                            title: Text('Female'),
                                            groupValue: _male_female,
                                            onChanged: (_value) {
                                              setState(() {
                                                print(_value);

                                                _male_female = _value;
                                                _gender = 'female';
                                              });
                                            }),
                                      ),
                                    ],
                                  ),
                                ),
                                TextFormField(
                                  validator: (_val) => _val.isEmpty
                                      ? 'Enter valid address'
                                      : null,
                                  initialValue: userData.address,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Address',
                                  ),
                                  onChanged: (_val) {
                                    _address = _val;
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  validator: (_val) => _val.isEmpty
                                      ? 'Enter valid Nationality'
                                      : null,
                                  initialValue: userData.nationality,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Nationality',
                                  ),
                                  onChanged: (_val) {
                                    _nationality = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  validator: (_val) => _val.isEmpty
                                      ? 'Enter valid country of residence'
                                      : null,
                                  initialValue: userData.residence,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Country of residence',
                                  ),
                                  onChanged: (_val) {
                                    _residence = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.email,
                                  validator: (_val) =>
                                      _val.isEmpty ? 'Enter valid email' : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Student E-mail',
                                  ),
                                  onChanged: (_val) {
                                    _email = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.mobileNum,
                                  validator: (_val) => _val.isEmpty
                                      ? 'Enter valid Mob Num'
                                      : null,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Mobile Number',
                                  ),
                                  onChanged: (_val) {
                                    _mobileNum = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text('Any kind of disablity'),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: disablityNo,
                                          onChanged: (value) {
                                            setState(() {
                                              disablityNo = !disablityNo;
                                            });
                                          },
                                        ),
                                        Text('NO'),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: _checkBoxValue ?? false,
                                          onChanged: (bool value) {
                                            setState(() {
                                              _checkBoxValue = value;
                                              print(_checkBoxValue);
                                            });
                                          },
                                        ),
                                        Text('Yes'),
                                      ],
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  initialValue: userData.disability,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'if yes, mention it',
                                  ),
                                  onChanged: (_val) {
                                    _disability = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SECTION 2: PARENTS DETAILS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_name,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Full Name',
                                  ),
                                  onChanged: (_val) {
                                    _parent_name = _val;
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_email,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Email',
                                  ),
                                  onChanged: (_val) {
                                    _parent_email = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Contact details',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_phone1,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Phone # 1',
                                  ),
                                  onChanged: (_val) {
                                    _parent_phone1 = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_phone2,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Phone # 2',
                                  ),
                                  onChanged: (_val) {
                                    _parent_phone2 = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_city,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'City',
                                  ),
                                  onChanged: (_val) {
                                    _parent_city = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_country,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Country',
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'NIN Number',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_nin,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'NIN Number',
                                  ),
                                  onChanged: (_val) {
                                    _parent_nin = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Nationality',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.parent_nationality,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Nationality',
                                  ),
                                  onChanged: (_val) {
                                    _parent_nationality = _val;
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'SECTION 3: FORMER SCHOOL DETAILS',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.former_school,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Former schoold name*',
                                  ),
                                  onChanged: (_val) {
                                    _former_school = _val;
                                  },
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  initialValue: userData.former_class,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Class*',
                                  ),
                                  onChanged: (_val) {
                                    _former_class = _val.toString();
                                  },
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Performance (grade or points)*',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.blueGrey[900],
                                      )),
                                      child: Row(
                                        children: [
                                          Text('Grade'),
                                          SizedBox(width: 50.0),
                                          Icon(Icons.arrow_drop_down),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      height: 30.0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                        color: Colors.blueGrey[900],
                                      )),
                                      child: Row(
                                        children: [
                                          Text('Points'),
                                          SizedBox(width: 50.0),
                                          Icon(Icons.arrow_drop_down),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '\u26A0 Note: A copy of your previous report will be needed.',
                                  style: TextStyle(color: Colors.blue[900]),
                                ),
                                SizedBox(height: 15.0),
                                Row(
                                  children: [
                                    Checkbox(
                                        value: terms,
                                        onChanged: (value) {
                                          setState(() {
                                            terms = !terms;
                                          });
                                        }),
                                    Text(
                                      'I accept and agree with terms \nand conditions.',
                                      style: TextStyle(color: Colors.red[900]),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 100.0,
                            child: FlatButton.icon(
                              color: Colors.blueGrey[900],
                              onPressed: () async {
                                //print(_currentSugars);

                                if (_formKey.currentState.validate()) {
                                  await DatabaseService(uid: user.uid)
                                      .updateUserData(
                                    _firstName ?? userData.firstName,
                                    _middleName ?? userData.middleName,
                                    _lastName ?? userData.lastName,
                                    _address ?? userData.address,
                                    _nationality ?? userData.nationality,
                                    _residence ?? userData.residence,
                                    _email ?? userData.email,
                                    _mobileNum ?? userData.mobileNum,
                                    _disability ?? userData.disability,
                                    _gender ?? userData.gender,
                                    _parent_name ?? userData.parent_name,
                                    _parent_email ?? userData.parent_email,
                                    _parent_phone1 ?? userData.parent_phone1,
                                    _parent_phone2 ?? userData.parent_phone2,
                                    _parent_city ?? userData.parent_city,
                                    _parent_country ?? userData.parent_country,
                                    _parent_nin ?? userData.parent_nin,
                                    _parent_nationality ??
                                        userData.parent_nationality,
                                    _former_school ?? userData.former_school,
                                    _former_class ?? userData.former_class,
                                  );
                                  Navigator.pop(context);
                                }
                              },
                              icon: Icon(
                                Icons.save,
                                color: Colors.white,
                              ),
                              label: Text(
                                'SAVE FORM',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Text(
                            'Already created account? Login here',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey[900],
                            ),
                          ),
                          SizedBox(height: 30.0)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
