import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';
import 'package:islami_app/widgets%20screens/ahadethwidget.dart';
import 'package:islami_app/widgets%20screens/quranwidget.dart';
import 'package:islami_app/widgets%20screens/radiowidget.dart';
import 'package:islami_app/widgets%20screens/sebhawidget.dart';

class homescreen extends StatefulWidget {
  static final String routename = 'home';

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  int clickeditem = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'islami',
                style: TextStyle(color: mythemedata.secondarycolor,fontSize: 30),
              ),
              elevation: 0,
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: mythemedata.primarycolor,
                showUnselectedLabels: false,
                currentIndex: clickeditem,
                fixedColor: mythemedata.secondarycolor,
                unselectedItemColor: Colors.white,onTap: (int pos){
                  setState(() {
                    clickeditem=pos;
                  });
            }
               , selectedIconTheme: IconThemeData(size: 40),
                items: [
                  BottomNavigationBarItem(
                      label: 'quran',
                      icon: ImageIcon(AssetImage('assets/images/quran.png'))),
                  BottomNavigationBarItem(
                      label: 'hadeth',
                      icon: ImageIcon(AssetImage('assets/images/ahadeth.png'))),
                  BottomNavigationBarItem(
                      label: 'sebha',
                      icon: ImageIcon(AssetImage('assets/images/sebha.png'))),
                  BottomNavigationBarItem(
                      label: 'radio',
                      icon: ImageIcon(AssetImage('assets/images/radio.png'))),
                ]),body: onitem(clickeditem),),
      ),

    );

  }
  Widget onitem(int pos){
    if(pos==0){
      return quran();
    }else if(pos==1){
return hadeth();
    }else if(pos==2){
return sebha();
    }else{
return radio();
    }
  }

  }

