import 'package:flutter/material.dart';

class CountryDataCard extends StatelessWidget {
  CountryDataCard({
    required this.country,
    required this.totalCases,
    required this.newCases,
    required this.totalDeaths,
    required this.activeCases,
    required this.newDeaths,
    required this.totalRecovered,
    Key? key,
  }) : super(key: key);

  final String country;
  final String totalCases;
  final String newCases;
  final String totalDeaths;
  final String newDeaths;
  final String totalRecovered;
  final String activeCases;

  TextStyle style = const TextStyle(
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0,),
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              country,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  "Total Cases: $totalCases",
                  style: style,
                ),
                Text(
                  "Active Cases: $activeCases",
                  style: style,
                ),
                Text(
                  "New Cases: $newCases",
                  style: style,
                ),
                Text(
                  "Total Deaths: $totalDeaths",
                  style: style,
                ),
                Text(
                  "Total Recovered: $totalRecovered",
                  style: style,
                ),
                Text(
                  "New Deaths: $newDeaths",
                  style: style,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
