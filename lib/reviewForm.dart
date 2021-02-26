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
                    Text('firstName ' + snapshot.data.firstName.toString()),
                    Text('middleName ' + snapshot.data.middleName.toString()),
                    Text('lastName ' + snapshot.data.lastName.toString()),
                    Text('address ' + snapshot.data.address.toString()),
                    Text('nationality ' + snapshot.data.nationality.toString()),
                    Text('residence ' + snapshot.data.residence.toString()),
                    Text('email ' + snapshot.data.email.toString()),
                    Text('mobileNum ' + snapshot.data.mobileNum.toString()),
                    Text('disability ' + snapshot.data.disability.toString()),
                    Text('gender ' + snapshot.data.gender.toString()),
                    Text('parent name ' + snapshot.data.parent_name.toString()),
                    Text('parent email ' +
                        snapshot.data.parent_email.toString()),
                    Text('parent phone1 ' +
                        snapshot.data.parent_phone1.toString()),
                    Text('parent phone2 ' +
                        snapshot.data.parent_phone2.toString()),
                    Text('parent city ' + snapshot.data.parent_city.toString()),
                    Text('parent country ' +
                        snapshot.data.parent_country.toString()),
                    Text('parent nin ' + snapshot.data.parent_nin.toString()),
                    Text('parent nationality ' +
                        snapshot.data.parent_nationality.toString()),
                    Text('former school ' +
                        snapshot.data.former_school.toString()),
                    Text('former class ' +
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
