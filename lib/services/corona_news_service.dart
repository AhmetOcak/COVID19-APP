import 'dart:convert';

import 'package:covid19_app/models/corona_news_model.dart';
import 'package:http/http.dart' as http;

class GetCoronaNews {
  Future<String> _getData() async {
    Uri url = Uri.parse("https://api.collectapi.com/corona/coronaNews");

    var response = await http.post(
      url,
      headers: {
        "content-type": "application/json",
        "authorization": "apikey 2ehyKijlw4TOgwHb5zGL11:7wyAgBY84SwkjUDPGVaZmG",
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
