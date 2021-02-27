import 'package:flutter/material.dart';
import 'package:online_admissions3/loading.dart';
import 'package:online_admissions3/services/database.dart';
import 'package:provider/provider.dart';

//import 'brew.dart';
//import 'brew_list.dart';
import 'user-model.dart';
import 'welcome.dart';

class ReviewForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blueGrey[900],
                title: Text('Review Form'),
                //centerTitle: true,
                actions: [
                  FlatButton.icon(
                    label: Text(
                      'HOME',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: Icon(Icons.home, color: Colors.white),
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
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('FIRSTNAME ' + snapshot.data.firstName.toString()),
                    Text('MIDDLENAME ' + snapshot.data.middleName.toString()),
                    Text('LASTNAME ' + snapshot.data.lastName.toString()),
                    Text('ADDRESS ' + snapshot.data.address.toString()),
                    Text('NATIONALITY ' + snapshot.data.nationality.toString()),
                    Text('RESIDENCE ' + snapshot.data.residence.toString()),
                    Text('EMAIL ' + snapshot.data.email.toString()),
                    Text('MOBILENUMBER ' + snapshot.data.mobileNum.toString()),
                    Text('DISABILITY ' + snapshot.data.disability.toString()),
                    Text('GENDER ' + snapshot.data.gender.toString()),
                    Text('PARENT NAME ' + snapshot.data.parent_name.toString()),
                    Text('PARENT EMAIL ' +
                        snapshot.data.parent_email.toString()),
                    Text('PARENT PHONE 1 ' +
                        snapshot.data.parent_phone1.toString()),
                    Text('PARENT PHONE 2 ' +
                        snapshot.data.parent_phone2.toString()),
                    Text('PARENT CITY ' + snapshot.data.parent_city.toString()),
                    Text('PARENT COUNTRY ' +
                        snapshot.data.parent_country.toString()),
                    Text('PARENT NIN ' + snapshot.data.parent_nin.toString()),
                    Text('PARENT NATIONALITY ' +
                        snapshot.data.parent_nationality.toString()),
                    Text('FORMER SCHOOL ' +
                        snapshot.data.former_school.toString()),
                    Text('FORMER SCHOOL ' +
                        snapshot.data.former_class.toString()),
                  ],
                ),
              ));
        } else {
          return Loading();
        }
      },
    );
  }
}
