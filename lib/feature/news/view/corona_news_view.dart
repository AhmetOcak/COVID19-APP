import 'package:covid19_app/core/components/spinkit/spinkit.dart';
import 'package:covid19_app/core/constants/colors.dart';
import 'package:covid19_app/feature/news/model/corona_news_model.dart';
import 'package:covid19_app/feature/news/model/news_card.dart';
import 'package:covid19_app/feature/news/service/corona_news_service.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  CoronaNewsModel _newsModel = CoronaNewsModel();
  final GetCoronaNews _coronaNews = GetCoronaNews();

  int listLength = 0;
  bool dataCheck = false;

  @override
  void initState() {
    super.initState();
    getCoronaNews().then((value) => setState(() {
          listLength = _newsModel.result!.length;
          dataCheck = true;
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
            dataCheck == false ? const SpinKit() : DataArea(context),
          ],
        ),
      ),
    );
  }

  Container DataArea(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: listLength,
        itemBuilder: (BuildContext context, int index) {
          return NewsCard(
            image: _newsModel.result![index].image.toString(),
            name: _newsModel.result![index].name.toString(),
            description: _newsModel.result![index].description.toString(),
            source: _newsModel.result![index].source.toString(),
            url: _newsModel.result![index].url.toString(),
          );
        },
      ),
    );
  }
}
