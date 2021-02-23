import 'package:cloud_firestore/cloud_firestore.dart';

import '../brew.dart';
import '../user-model.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  Future updateUserData(
    String firstName,
    String middleName,
    String lastName,
    String address,
    String nationality,
    String residence,
    String email,
    String mobileNum,
    String disability,
    String gender,
    String parent_name,
    String parent_email,
    String parent_phone1,
    String parent_phone2,
    String parent_city,
    String parent_country,
    String parent_nin,
    String parent_nationality,
    String former_school,
    String former_class,
  ) async {
    return await brewCollection.document(uid).setData({
      '_firstName': firstName,
      '_middleName': middleName,
      '_lastName': lastName,
      '_address': address,
      '_nationality': nationality,
      '_residence': residence,
      '_email': email,
      '_mobileNum': mobileNum,
      '_disability': disability,
      '_gender': gender,
      '_parent_name': parent_name,
      '_parent_email': parent_email,
      '_parent_phone1': parent_phone1,
      '_parent_phone2': parent_phone2,
      '_parent_city': parent_city,
      '_parent_country': parent_country,
      '_parent_nin': parent_nin,
      '_parent_nationality': parent_nationality,
      '_former_school': former_school,
      '_former_class': former_class,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        firstName: doc.data['_firstName'] ?? '',
        middleName: doc.data['_middleName'] ?? '',
        lastName: doc.data['_lastName'] ?? '',
        address: doc.data['_address'] ?? '',
        nationality: doc.data['_nationality'] ?? '',
        residence: doc.data['_residence'] ?? '',
        email: doc.data['_email'] ?? '',
        mobileNum: doc.data['_mobileNum'] ?? '',
        disability: doc.data['_disability'] ?? '',
        gender: doc.data['_gender'] ?? '',
        parent_name: doc.data['_parent_name'] ?? '',
        parent_email: doc.data['_parent_email'] ?? '',
        parent_phone1: doc.data['_parent_phone1'] ?? '',
        parent_phone2: doc.data['_parent_phone2'] ?? '',
        parent_city: doc.data['_parent_city'] ?? '',
        parent_country: doc.data['_parent_country'] ?? '',
        parent_nin: doc.data['_parent_nin'] ?? '',
        parent_nationality: doc.data['_parent_nationality'] ?? '',
        former_school: doc.data['_former_school'] ?? '',
        former_class: doc.data['_former_class'] ?? '',
      );
    }).toList();
  }

// userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      firstName: snapshot.data['_firstName'],
      middleName: snapshot.data['_middleName'],
      lastName: snapshot.data['_lastName'],
      address: snapshot.data['_address'],
      nationality: snapshot.data['_nationality'],
      residence: snapshot.data['_residence'],
      email: snapshot.data['_email'],
      mobileNum: snapshot.data['_mobileNum'],
      disability: snapshot.data['_disability'],
      gender: snapshot.data['_gender'],
      parent_name: snapshot.data['_parent_name'] ?? '',
      parent_email: snapshot.data['_parent_email'] ?? '',
      parent_phone1: snapshot.data['_parent_phone1'] ?? '',
      parent_phone2: snapshot.data['_parent_phone2'] ?? '',
      parent_city: snapshot.data['_parent_city'] ?? '',
      parent_country: snapshot.data['_parent_country'] ?? '',
      parent_nin: snapshot.data['_parent_nin'] ?? '',
      parent_nationality: snapshot.data['_parent_nationality'] ?? '',
      former_school: snapshot.data['_former_school'] ?? '',
      former_class: snapshot.data['_former_class'] ?? '',
    );
  }

  //get brews stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  // get user doc stream
  Stream<UserData> get userData {
    return brewCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
