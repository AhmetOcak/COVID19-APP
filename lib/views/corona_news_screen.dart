import 'package:covid19_app/constants/colors.dart';
import 'package:covid19_app/models/corona_news_model.dart';
import 'package:covid19_app/services/corona_news_service.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  CoronaNewsModel _newsModel = CoronaNewsModel();
  GetCoronaNews _coronaNews = GetCoronaNews();

  String url = "https://www.ledr.com/colours/white.jpg";
  String name = "";
  String description = "";

  @override
  void initState() {
    super.initState();
    getCoronaNews().then((value) => setState(() {
          url = _newsModel.result![0].image.toString();
          name = _newsModel.result![0].name.toString();
          description = _newsModel.result![0].description.toString();
        }));
  }

  Future<CoronaNewsModel> getCoronaNews() async {
    CoronaNewsModel newsModel = await _coronaNews.loadData();
    _newsModel = newsModel;
    return _newsModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          url,
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width / 2.5,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Text(
                            name,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Flexible(
                      child: Text(description),
                    ),
                  ),
                  Row(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
