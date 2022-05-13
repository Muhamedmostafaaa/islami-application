import 'package:flutter/material.dart';
import 'package:islami_app/hadeth%20fragment/hadethscreen.dart';
import 'package:islami_app/sura%20fragment/surascreen.dart';
import 'homescreen.dart';


void main(){
runApp(myapp());
}
class myapp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: mythemedata.secondarycolor,primary: mythemedata.primarycolor // Your accent color
      ), ),
    routes: {
  homescreen.routename:(context)=>homescreen(),
      surascreen.routename:(context)=>surascreen(),
      hadethscreen.routename:(context)=>hadethscreen()
},
      initialRoute: homescreen.routename,
    );

  }
}
class mythemedata{
  static var primarycolor=Color.fromRGBO(183, 147, 95, 1.0);
  static var secondarycolor=Color.fromRGBO(36, 36, 36, 1.0);

}
