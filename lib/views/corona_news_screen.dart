import 'package:covid19_app/components/news_card.dart';
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
  String source = "";
  int listLength = 0;

  @override
  void initState() {
    super.initState();
    getCoronaNews().then((value) => setState(() {
          url = _newsModel.result![0].image.toString();
          name = _newsModel.result![0].name.toString();
          name = name.replaceAll('\\', "");
          description = _newsModel.result![0].description.toString();
          source = _newsModel.result![0].source.toString();
          listLength = _newsModel.result!.length;
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
            Container(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemCount: listLength,
                itemBuilder: (BuildContext context, int index) {
                  return NewsCard(
                      url: _newsModel.result![index].image.toString(),
                      name: _newsModel.result![index].name.toString(),
                      description: description =
                          _newsModel.result![index].description.toString(),
                      source: _newsModel.result![index].source.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
