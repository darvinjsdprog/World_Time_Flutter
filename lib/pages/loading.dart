
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void setupWorldTime() async{
    WorldTime wtime = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await wtime.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': wtime.location,
      'flag': wtime.flag,
      'time': wtime.time,
      'isDayTime': wtime.isDayTime
    });
  }
  
  @override
  void initState() {
    super.initState();
  setupWorldTime();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}