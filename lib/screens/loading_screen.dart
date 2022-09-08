import 'dart:convert'; //deals with importing json weather data

import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; //for spinning loader
import 'package:clima/services/weather.dart';


const apiKey = '______________________'; //personal API key obtained from openweather.com to enable live weather updates

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

  void getLocationData() async{ //async means this process happens independently of anything else that is happening
    Location location = Location();
    await location.getCurrentPosition(); //await enables us access to latitude and longitude from location.dart
    // latitude = location.latitude; //saving the latitude and longitude into usable variables
    // longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'); //units specifies celcius or fahrenheit
    //$latitude and $longitude come from the geo locator
    var weatherData = await networkHelper.getData(); //Tapping into the weather data we get back for use elsewhere

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,); //to display location screen we should have imported it
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitSpinningLines(
          color: Colors.yellow,
          size: 100.0, //Size in pixels
        ),
      ),
    );
  }
}
