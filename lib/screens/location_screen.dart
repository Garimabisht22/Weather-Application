import 'package:clima/screens/city_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen(this.LocationWeather);
  final LocationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String weatherIcon;
  String city;
  String weatherMessage;
  WeatherModel weather = WeatherModel();
  // String weatherTitle;

  @override
  void initState() {
    super.initState();
    updateUI(widget.LocationWeather);
  }

  void updateUI(var weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        city = '';
        weatherMessage = 'Unable to get weather data';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      //  print(temp);
      var condition = weatherData['weather'][0]['id'];

      print(condition);
      weatherIcon = weather.getWeatherIcon(condition);
      print(weatherIcon);
      weatherMessage = weather.getMessage(weatherIcon);
      print(weatherMessage);
      city = weatherData['name'];
    });
    // print(city);
  }

  Widget build(BuildContext context) {
    print('entered next screen');
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Column(
            ////  mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var typeName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        print('entering');
                        return CityScreen();
                      }));
                      print(typeName);
                      if (typeName != null)  {
                       var cityTempData =await weather.getCityWeather(typeName);
                       updateUI(cityTempData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 0, 15),
                child: Text(
                  weatherIcon,
                  style: kConditionTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  '$temperature°',
                  style: kTempTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 15, 0),
                child: Text(
                  '$weatherMessage $city',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),

              // ),
            ],
          ),
        ),
      ),
    );
  }
}
//
