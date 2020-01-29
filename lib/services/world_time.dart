import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{

  String location; //Location name for the UI

  String time; //the time in that location

  String flag; //url to asset the flag

  String url; //url of the api

  bool isDayTime; // true if is day false if is night

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {

    try{
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
   Map data = jsonDecode(response.body);
   
   //get property from data
   String datetime = data['datetime'];
   String offset = data['utc_offset'].substring(1,3);

   //create datetime object
   DateTime now = DateTime.parse(datetime);
   now = now.add(Duration(hours: int.parse(offset)));

   isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
   time = DateFormat.jm().format(now);
    }
    catch(e){
      print(e);
      time = 'Sorry, coult not get the time';
    }

   

  }
}

WorldTime wtime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');