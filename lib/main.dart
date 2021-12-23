import 'package:covid19_app/views/continent_data_screen.dart';
import 'package:covid19_app/views/corona_news_screen.dart';
import 'package:covid19_app/views/country_data_screen.dart';
import 'package:covid19_app/views/stay_home_screen.dart';
import 'package:covid19_app/views/total_data_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => StayHomeScreen(),
        '/country': (context) => CountryDataScreen(),
        '/total': (context) => TotalDataScreen(),
        '/news': (context) => NewsScreen(),
        '/continent': (context) => ContinentDataScreen(),
      },
    ),
  );
}
