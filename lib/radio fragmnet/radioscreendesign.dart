import 'package:flutter/material.dart';
import 'package:islami_app/main.dart';
import 'package:islami_app/model/RadioResponse.dart';
import 'package:islami_app/model/radios.dart';
import 'package:islami_app/widgets%20screens/radiowidget.dart';

class radiodesign extends StatefulWidget{
  Radios item;
  Function play,stop;
  radiodesign(this.item,this.play,this.stop);

  @override
  State<radiodesign> createState() => _radiodesignState();
}

class _radiodesignState extends State<radiodesign> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(width: MediaQuery.of(context).size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.item.name,style: TextStyle(fontSize: 22,color: mythemedata.secondarycolor),),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: ()=>{widget.play(widget.item.radio_url)}, icon: Icon(Icons.play_circle_outline_rounded,color: mythemedata.primarycolor,size: 45,)),
              SizedBox(width: 40,),
              IconButton(onPressed: ()=>{widget.stop()}, icon: Icon( Icons.pause,color: mythemedata.primarycolor,size: 45,))
            ],
          )
        ],
      ),
    );
  }
}