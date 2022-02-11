import 'dart:convert';

import 'package:covid19_app/api_key.dart';
import 'package:covid19_app/feature/country/model/countries_data_model.dart';
import 'package:http/http.dart' as http;

class GetCountriesData {
  Future<String> _getData() async {
    Uri url = Uri.parse("https://api.collectapi.com/corona/countriesData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": GetApiKey.apiKey,
    });

    return response.body;
  }

  Future loadData() async {
    String jsonProduct = await _getData();
    final jsonRespone = json.decode(jsonProduct);
    CountriesModel countriesModel = CountriesModel.fromJson(jsonRespone);
    return countriesModel;
  }
}
