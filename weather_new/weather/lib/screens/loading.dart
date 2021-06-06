import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather/screens/weather_screen.dart';
const apikey ='d55c3c13019d0cc5b171ada9a0fd1198';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  double lat;
  double lon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();

  }

  void getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
      print(lat);
      print(lon);
    } catch (e) {
      print('인터넷 연결에 문제가 발생했습니다');
    }

    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apikey&units=metric';

    var response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      String jsonData = response.body;
      var weatherData = jsonDecode(jsonData);
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return WeatherScreen(parseWeatherData : weatherData);
      }));
    }else{
      print(response.statusCode);
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text('내 위치 찾기'),
        ),
      ),
    );
  }
}
