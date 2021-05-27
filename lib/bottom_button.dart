import 'package:flutter/material.dart';
import 'constants.dart';
import 'result_page.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap,@required this.buttontitle});
  final Function onTap;
  final String buttontitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(buttontitle,
            style: kLargebutton,),
        ),
        color: kBottomcolourconatiner,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15.0),
        width: double.infinity,
        height: kBottomcontainerheight,
      ),
    );
  }
}