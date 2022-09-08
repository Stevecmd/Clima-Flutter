import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper{

  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    // print(response.body);
    // print(response.statusCode); //Get the status code for the connection to the open weather api
    if (response.statusCode == 200) { //200 means it successfully connected
      String data = response.body;
      // print(data); //prints the data received from OpenWeather
      return jsonDecode(data); //jsonDecode comes with Flutter to automatically decode json data
    } else {
      print(response.statusCode);
    }
  }

}