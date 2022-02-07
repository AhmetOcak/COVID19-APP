import 'package:covid19_app/components/continent_data_card.dart';
import 'package:covid19_app/constants/colors.dart';
import 'package:covid19_app/models/continent_data_model.dart';
import 'package:covid19_app/services/continent_data_service.dart';
import 'package:flutter/material.dart';

class ContinentDataScreen extends StatefulWidget {
  const ContinentDataScreen({Key? key}) : super(key: key);

  @override
  _ContinentDataScreenState createState() => _ContinentDataScreenState();
}

class _ContinentDataScreenState extends State<ContinentDataScreen> {
  ContinentDataModel _continentDataModel = ContinentDataModel();
  final GetContinentData _getContinentData = GetContinentData();

  int listLength = 0;

  Future<ContinentDataModel> getContinentData() async {
    ContinentDataModel continentDataModel = await _getContinentData.loadData();
    _continentDataModel = continentDataModel;
    return _continentDataModel;
  }

  @override
  void initState() {
    super.initState();
    getContinentData().then((value) => setState(() {
          listLength = _continentDataModel.result!.length;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                itemCount: listLength,
                itemBuilder: (BuildContext context, int index) {
                  return ContinentDataCard(
                    activeCases: _continentDataModel.result![index].activeCases
                        .toString(),
                    continent:
                        _continentDataModel.result![index].continent.toString(),
                    newCases:
                        _continentDataModel.result![index].newCases.toString(),
                    newDeaths:
                        _continentDataModel.result![index].newDeaths.toString(),
                    totalCases: _continentDataModel.result![index].totalCases
                        .toString(),
                    totalDeaths: _continentDataModel.result![index].totalDeaths
                        .toString(),
                    totalRecovered: _continentDataModel
                        .result![index].totalRecovered
                        .toString(),
                        
                  );
                }),
          ),
        ],
      ),
    );
  }
}
