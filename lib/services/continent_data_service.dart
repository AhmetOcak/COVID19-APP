import 'dart:convert';

import 'package:covid19_app/models/continent_data_model.dart';
import 'package:http/http.dart' as http;

class GetContinentData {
  Future<String> _getData() async {
    Uri url = Uri.parse("https://api.collectapi.com/corona/continentData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": "apikey 2ehyKijlw4TOgwHb5zGL11:7wyAgBY84SwkjUDPGVaZmG",
    });

    return response.body;
  }

  Future<ContinentDataModel> loadData() async {
    String jsonProduct = await _getData();
    final jsonResponse = jsonDecode(jsonProduct);
    ContinentDataModel continentDataModel =
        ContinentDataModel.fromJson(jsonResponse);
    return continentDataModel;
  }
}
