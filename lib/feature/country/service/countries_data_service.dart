import 'dart:convert';

import 'package:covid19_app/feature/country/model/countries_data_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetCountriesData {
  Future<String> _getData() async {
    Uri url = Uri.parse("${dotenv.env["BASE_URL"].toString()}countriesData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": dotenv.env["API_KEY"].toString(),
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
