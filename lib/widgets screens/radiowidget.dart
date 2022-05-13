import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/model/RadioResponse.dart';
import 'package:islami_app/radio%20fragmnet/radioscreendesign.dart';

class radio extends StatefulWidget {
  @override
  State<radio> createState() => _radioState();
}

class _radioState extends State<radio> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchradios();
  }
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {

    Future<RadioResponse> response;
    return FutureBuilder<RadioResponse>(
        future: fetchradios(),
        builder: (buildcontext, snapShot) {
          if (snapShot.hasData) {
            return Column(
              children: [
                Container(
                    margin: EdgeInsets.only(top: 120),
                    child: Center(
                        child: Image(
                            image: AssetImage('assets/images/radio_logo.png')))),
             Expanded(
               child: ListView.builder(physics: PageScrollPhysics(),scrollDirection: Axis.horizontal,itemBuilder: (context,index){
                 return radiodesign(snapShot.data!.radios[index],play,Stop);
               }),
             )
              ],
            );
          } else if (snapShot.hasError) {
            return Text(snapShot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
  play(String url) async {
    Stop();
    int result = await audioPlayer.play(url);

  }
  Stop()async{int result = await audioPlayer.stop();}
}

Future<RadioResponse> fetchradios() async {
  http.Response response = await http
      .get(Uri.parse('http://api.mp3quran.net/radios/radio_arabic.json'));
  if (response.statusCode == 200) {

    return RadioResponse.fromJsonMap(jsonDecode(utf8.decode(response.bodyBytes)));
  } else {
    throw (Exception(response.body.toString()));
  }
}

