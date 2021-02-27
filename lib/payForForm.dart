import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customButton.dart';
import 'services/database.dart';
import 'user-model.dart';
import 'welcome.dart';


String phoneNum;

class PayForForm extends StatefulWidget {
  @override
  _PayForFormState createState() => _PayForFormState();
}

class _PayForFormState extends State<PayForForm> {
  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<User>(context);
      final brewCollection =
      Firestore.instance.collection('payments');
//.setData(Payment())
//.collection('payments')
//.document(userId.uid).collection('payments')

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: userId.uid).userData,
        // ignore: missing_return
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var userData = snapshot.data;
            return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('Pay For Form'),
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
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.credit_card,
                  size: 50.0,
                ),
                SizedBox(width: 10.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.blueGrey[900],
                  ),
                  height: 50,
                  width: 200.0,
                  child: Center(
                      child: Text(
                    'PAY UGX 50,000',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            // Text(
            //           "Enter Mobile Number",
            //           style: TextStyle(color: Colors.blueGrey[900]),
            //         ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Mobile Number',
                ),
              onChanged: (_value){
                phoneNum = _value;
              },
              ),
            ),
            SizedBox(height: 5.0),

                        CustomButton1(
              label: 'Pay Now',
              onPressed: (){
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder: (context) => Loading(),
                 ),
                 );
              },
print('my user id is #');
 await brewCollection.document(userId.uid).setData({
    'name' : userData.firstName.toString(),
    'email' : userData.email.toString(),   
    'userId': userId.uid.toString(),   
    'phoneNumber': phoneNum.toString(),   
    'pending': true,   
    'Response': 'Waiting time',   
    'isSuccessful': true,
    'creationTime': Timestamp.now(),
 });
                
              },
            ),

            SizedBox(height: 5.0),
            
            Text(
              '\u26A0 Please respond to the prompt on your phone.',
              style: TextStyle(color: Colors.red[900]),
            ),

            SizedBox(height: 10.0),

            Text(
              '\u26A0 Note: This fees is not refundable.',
              style: TextStyle(color: Colors.red[900]),
            ),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Icon(Icons.notifications),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      '''You will receive a confirmation email or \nphone call soon.''',
                      style: TextStyle(color: Colors.red[900]),
                      //softWrap:true,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  
  }
  );


  }
}
