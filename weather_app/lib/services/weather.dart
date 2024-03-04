import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  String location = '';
  String country = '';
  String localtime = '';
  String condition = '';
  String icon = '';
  String temp = '';
  late double tempCelsius;
  String flag = '';

  Weather({required this.location, required this.flag});

  Future<void> getWeather() async {
    // make the request
    try {
      Response response = await get(Uri.parse(
          'your weatherapi')); // Replace 'your weatherapi' with the actual API endpoint URL
      Map data = jsonDecode(response.body);

      tempCelsius = data['current']['temp_c'];
      country = data['location']['name'];
      String timeString = data['location']['localtime'];
      condition = data['current']['condition']['text'];
      String iconUrl = data['current']['condition']['icon'];

      int startIndex = iconUrl.indexOf('/64x64');
      icon = iconUrl.substring(startIndex);
      localtime = timeString.substring(11);

      print('Local Time: $localtime');
      print(tempCelsius);
    } on Exception catch (e) {
      print('Error - $e');
    }
  }
}
