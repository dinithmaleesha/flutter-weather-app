import 'package:flutter/material.dart';
import 'package:weather_app/pages/choose_location.dart';
import 'package:weather_app/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/location': (context) => const ChooseLocation(),
    },
  ));
}
