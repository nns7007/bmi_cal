import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ReusableCode extends StatelessWidget {
  ReusableCode({@required this.colour,this.Cardchild,this.onpress});
  final Color colour;
  final Widget Cardchild;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: Cardchild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
