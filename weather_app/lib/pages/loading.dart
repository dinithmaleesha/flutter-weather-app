import 'package:flutter/material.dart';
import 'package:weather_app/pages/home.dart';
import 'package:weather_app/services/weather.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String weather = '';
  String tempString = '';
  String c = '';
  String country = '';
  String localtime = '';
  String condition = '';
  String icon = '';
  String temp = '';
  late double tempCelsius;

  void getData() async {
    Weather instance = Weather(location: 'Sri Lanka', flag: 'sl.png');
    await instance.getWeather();

    double temp = instance.tempCelsius;
    tempString = temp.toString();
    country = instance.country;
    localtime = instance.localtime;
    condition = instance.condition;
    icon = instance.icon;

    setState(() {
      c = tempString;
    });

    // ignore: use_build_context_synchronously
    try {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
            tempString: tempString,
            country: country,
            time: localtime,
            condition: condition,
            icon: icon,
          ),
        ),
      );
    } catch (e) {
      print('Error navigating to Home: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    print('Loading Screen');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
