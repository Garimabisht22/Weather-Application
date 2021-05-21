import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void getLocation() async {
  try {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    print(position);
  }
  catch (e) {
    print(e);
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState(){
    super.initState();
  }
//  print('init is called');

  Widget build(BuildContext context) {
    print('build is called');
     return Scaffold(
     );
    //   body: Center(
    //     child: TextButton(
    //       onPressed: () {
    //         getLocation();
    //       },
    //       child: Text('Get Location'),
    //     ),
    //   ),
  }
}