import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const kApiKey = '953144532f238f23099574e828b7e991';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override

  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    longitude= location.longitude;
    latitude = location.latitude;
    getData();
  }

  void getData() async {
    var url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey');
    var response = await http.post(url, body: {
    });
    print(response.statusCode );
    //  Response response = await get('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22';

    if (response.statusCode == 200) {
      String data = response.body;
      var temp = jsonDecode(data)['main']['temp'];
      print(temp);

      var id = jsonDecode(data)['weather'][0]['id'];
      print(id);

      var city = jsonDecode(data)['name'];
      print(city);

    } else{
      print(response.statusCode);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
