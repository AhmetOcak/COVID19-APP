import 'dart:convert';

import 'package:covid19_app/models/corona_news_model.dart';
import 'package:http/http.dart' as http;

class GetCoronaNews {
  Future<Null> getData() async {
    Uri url = Uri.parse("https://api.collectapi.com/corona/coronaNews");

    var response = await http.post(
      url,
      headers: {
        "content-type": "application/json",
        "authorization": "apikey 2ehyKijlw4TOgwHb5zGL11:7wyAgBY84SwkjUDPGVaZmG",
      },
    );
    
     var json = jsonDecode(response.body)["result"] as List; 
     List<CoronaNewsModel> newsList = json.map((e) => CoronaNewsModel.fromJson(e)).toList();
     print(newsList);

  }
}
