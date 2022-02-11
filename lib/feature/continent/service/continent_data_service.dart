import 'dart:convert';

import 'package:covid19_app/api_key.dart';
import 'package:covid19_app/feature/continent/model/continent_data_model.dart';
import 'package:http/http.dart' as http;

class GetContinentData {
  Future<String> _getData() async {
    Uri url = Uri.parse("https://api.collectapi.com/corona/continentData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": GetApiKey.apiKey,
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
