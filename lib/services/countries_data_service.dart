import 'dart:convert';

import 'package:covid19_app/models/countries_data_model.dart';
import 'package:http/http.dart' as http;

class GetCountriesData {
  Future<CountriesModel> getData(String countryName) async {
    Uri url = Uri.parse("https://api.collectapi.com/corona/countriesData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": "apikey 2ehyKijlw4TOgwHb5zGL11:7wyAgBY84SwkjUDPGVaZmG",
    });


    final json = jsonDecode(response.body);   
    return CountriesModel.fromJson(json, countryName);
  }
}
