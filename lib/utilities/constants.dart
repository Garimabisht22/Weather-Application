import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kApiKey = '953144532f238f23099574e828b7e991';
const kApiMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

const kTempTextStyle = TextStyle(
  fontFamily: 'Newsreader',
  fontSize: 120.0,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Pacifico',
  fontSize: 50.0,
  color: Colors.black,
);
const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Newsreader',
  color: Colors.white,
);

const kConditionTextStyle = TextStyle(fontSize: 140.0, color: Colors.white);
const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
      size: 45,
    ),
    hintText: 'Enter City Name',
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10),
      ),
      borderSide: BorderSide.none,
    )
);