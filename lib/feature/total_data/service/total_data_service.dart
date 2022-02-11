import 'dart:convert';

import 'package:covid19_app/feature/total_data/model/total_data_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetTotalData {
  Future<TotalDataModel> getData() async {
    Uri url = Uri.parse("${dotenv.env["BASE_URL"].toString()}totalData");

    var response = await http.post(url, headers: {
      "content-type": "application/json",
      "authorization": dotenv.env["API_KEY"].toString(),
    });

    final json = jsonDecode(response.body);
    return TotalDataModel.fromJson(json);
  }
}