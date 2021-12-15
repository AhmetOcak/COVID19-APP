import 'package:covid19_app/models/countries_data_model.dart';
import 'package:covid19_app/services/countries_data_service.dart';
import 'package:flutter/material.dart';

class StayHomeScreen extends StatelessWidget {
   StayHomeScreen({Key? key}) : super(key: key);
  CountriesModel _countriesModel = CountriesModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () async {
          _countriesModel = await GetCountriesData().getData("Turkey");
          print(_countriesModel.country);
          print(_countriesModel.totalCases);
        }, child: Text("test")),
      ),
    );
  }
}
