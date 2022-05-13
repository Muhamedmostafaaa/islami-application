

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth%20fragment/hadethscreen.dart';
import 'package:islami_app/main.dart';


class hadeth extends StatefulWidget{

  @override
  State<hadeth> createState() => _hadethState();
}

class _hadethState extends State<hadeth> {
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    gethadethcontent('assets/content/hadeth.txt');
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Expanded(flex: 1,child: Center(child: Image(image: AssetImage('assets/images/hadeth_logo.png')))),

        Expanded(flex: 3,child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
    border:
    Border.all(color: mythemedata.primarycolor, width: 2)),
    child: Text(
    'hadeth name',
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: 22, color: mythemedata.secondarycolor),
    ),
    ),Expanded(
      child: eachhadethcontent.length==0?CircularProgressIndicator():ListView.separated(itemBuilder: (context,index){
        return Center(child: InkWell(onTap: (){Navigator.pushNamed(context, hadethscreen.routename,arguments:  eachhadethcontent[index]);},child: Text(eachhadethcontent[index].title,style:TextStyle( fontSize: 20, color: mythemedata.secondarycolor),)));
              },itemCount: eachhadethcontent.length,separatorBuilder:(context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              color: mythemedata.primarycolor),
        );
      }, ),
    )

          ],
        )), ],
    );
  }
List<hadethdetails>eachhadethcontent=[];

  void gethadethcontent(String path)async{
   List<hadethdetails>example=[];
    String ahadeth=await rootBundle.loadString(path);

     List<String>hadeth=ahadeth.split('#\r\n');

    for(int i=0;i<hadeth.length;i++){
     String hadetharg=hadeth[i];

     List<String>hadethdetail= hadetharg.split('\n');

    String title=hadethdetail[0];
    String content='';
    for(int j=1;j<hadethdetail.length;j++){
      content=content+''+hadethdetail[j];
    }
         example.add(hadethdetails(title: title, content: content));

    }
    setState(() {
      eachhadethcontent=example;
    });

  }


}
class hadethdetails{
  String title;
  String content;
  hadethdetails({required this.title,required this.content});
}