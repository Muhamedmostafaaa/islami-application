import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';


class sebha extends StatefulWidget {
  @override
  State<sebha> createState() => _sebhaState();
}

class _sebhaState extends State<sebha> {
  int counter=0;
  int i=0;
  List<String>tasabeh=['الحمدلله','الله اكبر','سبحان الله'];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Container(
                margin: EdgeInsets.only(top: 35),
                child: Center(
                    child: Image(
                        image: AssetImage('assets/images/sebha_logo.png'))))),
        SizedBox(
          height: 40,
        ),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                Center(
                    child: Text(
                  'number of tasbeh',
                  style: TextStyle(
                      color: mythemedata.secondarycolor, fontSize: 18),
                )),
                Container(
                  height: 60,
                  width: 60,
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: mythemedata.primarycolor,
                  ),
                  child: Center(
                      child: Text(
                    counter.toString(),
                    style: TextStyle(
                        fontSize: 25,
                        color: mythemedata.secondarycolor,
                        fontWeight: FontWeight.bold),
                  )),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                        onPressed: onbuttonclick,
                        child: Text(
                          tasabeh[i],
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(110, 40),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                        )))
              ],
            ))
      ],
    );
  }
  void onbuttonclick(){
setState(() {
  if(counter<30){
    counter++;
  }else{
    counter=0;
    if(i< tasabeh.length-1){
      i++;
      tasabeh[i];}else{ i=0;}
  }
});
  }

}
