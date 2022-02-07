import 'package:flutter/material.dart';

class ContinentDataCard extends StatelessWidget {
  ContinentDataCard({
    required this.activeCases,
    required this.continent,
    required this.newCases,
    required this.newDeaths,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    Key? key,
  }) : super(key: key);

  final String continent;
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
      color: Colors.white70,
      margin: const EdgeInsets.all(8.0,),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              continent,
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
