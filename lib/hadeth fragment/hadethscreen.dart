import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';
import 'package:islami_app/widgets%20screens/ahadethwidget.dart';

class hadethscreen extends StatefulWidget {
  static final String routename = 'hadeth';

  @override
  State<hadethscreen> createState() => _hadethscreenState();
}

class _hadethscreenState extends State<hadethscreen> {
  @override
  Widget build(BuildContext context) {
    hadethdetails hadeth =
        ModalRoute.of(context)?.settings.arguments as hadethdetails;
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill)),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  iconTheme: IconThemeData(color: mythemedata.secondarycolor),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  title: Text(
                    'islami',
                    style: TextStyle(
                        color: mythemedata.secondarycolor, fontSize: 30),
                  ),
                  elevation: 0,
                ),
                body: Container(
                    margin: EdgeInsets.only(top: 90),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          hadeth.title,
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: mythemedata.secondarycolor,
                                    offset: Offset(0, -7))
                              ],
                              color: Colors.transparent,
                              fontSize: 30,
                              decoration: TextDecoration.underline,
                              decorationColor: mythemedata.primarycolor,
                              decorationThickness: 2),
                        )),
                        SizedBox(
                          height: 40,
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color.fromRGBO(248, 248, 248, 0.7)),
                              child: SingleChildScrollView(
                                  child: Text(
                                hadeth.content,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textDirection: TextDirection.rtl,
                              ))),
                        )
                      ],
                    )))));
  }
}
