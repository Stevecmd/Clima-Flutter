import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  void _determinePosition() async{ //async means this process happens independently of anything else that is happening
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low); //await says wait until we get the position before proceeding to print
    print(position); //Getting the location output
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // child: ElevatedButton(
          // onPressed: () {
          //   //Get the current location
          //   _determinePosition();
          // },
          // child: Text('Get Location'),
        // ),
      ),
    );
  }
}
