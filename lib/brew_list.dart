//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'brew.dart';
import 'brewTile.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);
    print(brews.length);
    //print(brews.documentChanges.toString());
    // for(var doc in brews.documents){
    //   print(doc.data);

    // }
    // brews.forEach((e) {
    //   print(e.name);
    //   print(e.sugars);
    //   print(e.strength);
    // });

    return Expanded(
      child: Container(
        height: 300.0,
        child: ListView.builder(
          itemCount: brews.length,
          itemBuilder: (context, index) {
            return BrewTile(brew: brews[index]);
          },
        ),
      ),
    );
  }
}
