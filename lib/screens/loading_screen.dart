import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
   var weatherData =  await WeatherModel().getLocationWeather();
     Navigator.push(context, MaterialPageRoute(builder: (context) {
       return LocationScreen(weatherData);
     })
     );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Clima',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
              fontFamily:'Pacifico',
          ),
          ),
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: Colors.white,
       body: Column(
         children: [
           Icon(Icons.cloud,
           color: Colors.lightBlueAccent[50],
           size: 340,),
           spin
         ],
       )
    );
  }
}
const spin = SpinKitWanderingCubes(
  color: Colors.pinkAccent,
  size: 250.0,
  //lineWidth: 30,
);