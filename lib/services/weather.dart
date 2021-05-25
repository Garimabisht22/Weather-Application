import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$kApiMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =  NetworkHelper(
        '$kApiMapUrl?q=$cityName&appid=$kApiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(String temp) {
    if (temp == '🌩') {
      return 'It\'s Thunderstorm time in ';
    } else if (temp == '🌧') {
      return "It's Drizzling time in";
    } else if (temp == '☔️') {
      return "It's going to get wet in";
    } else if (temp == '☃️') {
      return 'Its going to be snowy in ';
    } else if (temp == '🌫') {
      return 'Its going to be dusty in ';
    } else if (temp == '☀️') {
      return 'Its clear sky in';
    } else if (temp == '☁️') {
      return 'Its Cloudy in';
    } else {
      return 'Forget Weather';
    }
  }
}
