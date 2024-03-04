import 'package:flutter/material.dart';
import 'package:weather_app/services/weather.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<Weather> locations = [
    Weather(location: 'Sri Lanka', flag: 'sl.png'),
    Weather(location: 'New York', flag: 'us.png'),
    Weather(location: 'London', flag: 'uk.png'),
    Weather(location: 'Switzerland', flag: 'sw.png'),
    Weather(location: 'Tokyo', flag: 'jp.png'),
    Weather(location: 'Sydney', flag: 'au.png'),
    Weather(location: 'Cairo', flag: 'eg.png'),
    Weather(location: 'Chicago', flag: 'us.png'),
    Weather(location: 'Dubai', flag: 'ae.png'),
    Weather(location: 'Paris', flag: 'fr.png'),
    Weather(location: 'Seoul', flag: 'kr.png'),
    Weather(location: 'Kolkata', flag: 'in.png'),
    Weather(location: 'Maldives', flag: 'mv.png'),
    Weather(location: 'Dhaka', flag: 'bd.png'),
    Weather(location: 'Norway', flag: 'nr.png'),
  ];

  void updateWeather(index) async {
    Weather instance = locations[index];
    await instance.getWeather();

    String tempString = instance.tempCelsius.toString();

    // ignore: use_build_context_synchronously
    Navigator.pop(context, {
      'tempString': tempString,
      'country': instance.country,
      'time': instance.localtime,
      'condition': instance.condition,
      'icon': instance.icon
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Choose Location');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateWeather(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/flags/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
