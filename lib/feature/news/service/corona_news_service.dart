import 'dart:convert';

import 'package:covid19_app/feature/news/model/corona_news_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GetCoronaNews {
  Future<String> _getData() async {
    Uri url = Uri.parse("${dotenv.env["BASE_URL"].toString()}coronaNews");

    var response = await http.post(
      url,
      headers: {
        "content-type": "application/json",
        "authorization": dotenv.env["API_KEY"].toString(),
      },
    );

    return response.body;
  }

  Future<CoronaNewsModel> loadData() async {
    String jsonProduct = await _getData();
    final jsonResponse = jsonDecode(jsonProduct);
    CoronaNewsModel coronaNewsModel = CoronaNewsModel.fromJson(jsonResponse);
    return coronaNewsModel;
  }
}
