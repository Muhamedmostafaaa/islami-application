import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/main.dart';
import 'package:islami_app/sura%20fragment/sora%20details.dart';

class surascreen extends StatefulWidget {
  static String routename = 'surascreen';

  @override
  State<surascreen> createState() => _surascreenState();
}

class _surascreenState extends State<surascreen> {
  List<String> swar = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as data;
    readcontent('assets/content/${args.filepos}.txt');
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
                    suradetails(name: args.suraname, postion: args.filepos),
                    SizedBox(
                      height: 40,
                    ),
                    swar.length == 0
                        ? CircularProgressIndicator()
                        : Expanded(
                            child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(8),color:Color.fromRGBO(
                                248, 248, 248, 0.7)),
                              child: ListView.separated(
                                  itemBuilder: (context, index) {
                                    return Text(
                                      swar[index] + ' (${index + 1})',
                                      textAlign: TextAlign.center,
                                      textDirection: TextDirection.rtl,style: TextStyle(fontSize:18),
                                    );
                                  },
                                  itemCount: swar.length,
                                  separatorBuilder: (context, index) {
                                    return Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 3),
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 0.5),
                                            color: mythemedata.primarycolor));
                                  }),
                            ),
                          )
                  ],
                ),
              ),
            )));
  }

  void readcontent(String filename) async {
    String content = await rootBundle.loadString(filename);
    List<String> ayat = content.split('\n');
    setState(() {
      swar = ayat;
    });
  }
}

class data {
  String suraname;
  int filepos;

  data({required this.suraname, required this.filepos});
}
