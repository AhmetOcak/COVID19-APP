import 'dart:convert';

import 'package:covid19_app/api_key.dart';
import 'package:covid19_app/feature/total_data/model/total_data_model.dart';
import 'package:http/http.dart' as http;

class GetTotalData {
  Future<TotalDataModel> getData() async {
    Uri url = Uri.parse("https://api.collectapi.com/corona/totalData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": GetApiKey.apiKey,
    });

    final json = jsonDecode(response.body);
    return TotalDataModel.fromJson(json);
  }
}