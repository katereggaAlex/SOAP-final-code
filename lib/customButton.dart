
import 'package:flutter/material.dart';

class CustomButton1 extends StatelessWidget {
  CustomButton1({
   this.label,
   this.onPress,

  });

final Function onPress;
final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 70.0,
      padding: EdgeInsets.all(10),
      child: RawMaterialButton(
        fillColor: Colors.blueGrey[900],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          label
          ,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPress,
      ),
    );
  }
}
