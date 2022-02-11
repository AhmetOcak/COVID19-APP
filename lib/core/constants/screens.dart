import 'package:covid19_app/feature/continent/view/continent_data_view.dart';
import 'package:covid19_app/feature/country/view/country_data_view.dart';
import 'package:covid19_app/feature/home/view/stay_home_screen.dart';
import 'package:covid19_app/feature/news/view/corona_news_view.dart';
import 'package:covid19_app/feature/total_data/view/total_data_view.dart';

final screens = [
  const NewsScreen(),
  const TotalDataScreen(),
  const StayHomeScreen(),
  const CountryDataScreen(),
  const ContinentDataScreen()
];
