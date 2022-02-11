import 'dart:convert';
import 'dart:io';

import 'package:covid19_app/feature/continent/model/continent_data_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetContinentData {
  Future<String> _getData() async {
    Uri url = Uri.parse("${dotenv.env["BASE_URL"].toString()}continentData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": dotenv.env["API_KEY"].toString(),
    });

    return _controlBody(response);
  }

  Future<ContinentDataModel?> loadData() async {
    String jsonProduct = await _getData();
    if (jsonProduct == "error") {
      return null;
    } else {
      final jsonResponse = jsonDecode(jsonProduct);
      ContinentDataModel continentDataModel =
          ContinentDataModel.fromJson(jsonResponse);
      return continentDataModel;
    }
  }

  Future<String> _controlBody(response) async {
    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      return "error";
    }
  }
}
