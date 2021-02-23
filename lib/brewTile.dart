import 'package:flutter/material.dart';

import 'brew.dart';

class BrewTile extends StatelessWidget {
  final Brew brew;
  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              // backgroundColor: Colors.brown[brew.strength],
            ),

            // title: Text(brew.name,
            // style: TextStyle(color:Colors.black87)),
            // subtitle: Text('Takes ${brew.sugars} sugar(s)'),
          ),
        ),
      ),
    );
  }
}
