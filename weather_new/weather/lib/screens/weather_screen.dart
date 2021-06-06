import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class WeatherScreen extends StatefulWidget {
  final dynamic parseWeatherData;

  WeatherScreen({this.parseWeatherData});

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  String cityName;
  int temp;
  int tempMin;
  int tempMax;
  String description;

  var date = DateTime.now();

  @override
  // ignore: must_call_super
  void initState() {
    // TODO: implement initState
    updateData(widget.parseWeatherData);
  }

  void updateData(dynamic weatherData) {
    cityName = weatherData["name"];
    double tem2 = weatherData['main']['temp'];
    temp = tem2.toInt();
    description = weatherData['weather'][0]['description'];
    double tempMin2 = weatherData['main']['temp_min'];
    tempMin = tempMin2.toInt();
    double tempMax2 = weatherData['main']['temp_max'];
    tempMax = tempMax2.toInt();
  }

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("h:mm a").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              'image/background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 150),
                      Text(
                        '$cityName', style: GoogleFonts.lato(
                        color: Colors.white, fontSize:40, fontWeight: FontWeight.bold),

                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          TimerBuilder.periodic((Duration(minutes: 1)),
                              builder: (context) {
                            return Text(
                              '${getSystemTime()}',style: GoogleFonts.lato(
                              color: Colors.white, fontSize:16,)

                            );
                          }),
                          Text(DateFormat(' - EEEE, ').format(date),style: GoogleFonts.lato(
                              color: Colors.white, fontSize:16,)),
                          Text(DateFormat('d MMM, yyy').format(date),style: GoogleFonts.lato(
                            color: Colors.white, fontSize:16,)
                              )
                        ],
                      ),
                      SizedBox(height: 30),
                      Text(
                        '$temp \u2103',style: GoogleFonts.lato(
                        color: Colors.white, fontSize:50, fontWeight: FontWeight.bold)
                        ),

                      Row(
                        children: [
                          Icon(
                            Icons.wb_sunny,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text('$description', style: GoogleFonts.lato(
                            color: Colors.white, fontSize:16,)
                          )
                        ],
                      ),
                      Row(children: [
                        Text('최고기온 : $tempMax',style: GoogleFonts.lato(
                          color: Colors.white, fontSize:16,) ),
                        Text('최저기온 : $tempMin', style: GoogleFonts.lato(
                          color: Colors.white, fontSize:16,))
                      ],)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
