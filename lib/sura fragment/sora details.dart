import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';

class suradetails extends StatelessWidget {
  String name;
  int postion;

  suradetails({required this.name, required this.postion});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      name,
      style: TextStyle( shadows: [
        Shadow(
            color: mythemedata.secondarycolor,
            offset: Offset(0, -7))
      ],
          color: Colors.transparent,
          fontSize: 30,

          decoration: TextDecoration.underline,
          decorationColor: mythemedata.primarycolor,
          decorationThickness: 2),
    ));
  }
}
