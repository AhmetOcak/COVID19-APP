import 'package:covid19_app/models/corona_news_model.dart';
import 'package:covid19_app/models/countries_data_model.dart';
import 'package:covid19_app/models/total_data_model.dart';
import 'package:covid19_app/services/corona_news_service.dart';
import 'package:covid19_app/services/countries_data_service.dart';
import 'package:covid19_app/services/total_data_service.dart';
import 'package:flutter/material.dart';

class StayHomeScreen extends StatelessWidget {
  StayHomeScreen({Key? key}) : super(key: key);
  CoronaNewsModel _model = CoronaNewsModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              GetCoronaNews().getData();
              
            },
            child: Text("test")),
      ),
    );
  }
}
