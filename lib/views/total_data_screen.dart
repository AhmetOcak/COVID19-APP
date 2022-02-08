import 'package:covid19_app/components/data_card.dart';
import 'package:covid19_app/components/spin_kit.dart';
import 'package:covid19_app/constants/colors.dart';
import 'package:covid19_app/models/total_data_model.dart';
import 'package:covid19_app/services/total_data_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalDataScreen extends StatefulWidget {
  const TotalDataScreen({Key? key}) : super(key: key);

  @override
  _TotalDataScreenState createState() => _TotalDataScreenState();
}

class _TotalDataScreenState extends State<TotalDataScreen> {
  final GetTotalData _totalData = GetTotalData();
  TotalDataModel _dataModel = TotalDataModel();

  String totalDeath = " ";
  String totalCases = " ";
  String totalRecovered = " ";

  bool dataCheck = false;

  Future<TotalDataModel> getTotalData() async {
    TotalDataModel dataModel = await _totalData.getData();
    _dataModel = dataModel;
    return _dataModel;
  }

  @override
  void initState() {
    super.initState();
    getTotalData().then((value) => setState(() {
          totalDeath = value.totalDeaths!;
          totalCases = value.totalCases!;
          totalRecovered = value.totalRecovered!;
          dataCheck = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              dataCheck == false ? const SpinKit() : DataArea(context),
            ],
          ),
        ),
      ),
    );
  }

  Column DataArea(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 50,
          ),
          child: FaIcon(
            FontAwesomeIcons.skull,
            size: MediaQuery.of(context).size.width / 2,
            color: skullColor,
          ),
        ),
        TotalCard(
          text: "Total Deaths",
          data: totalDeath,
        ),
        TotalCard(
          text: "Total Cases",
          data: totalCases,
        ),
        TotalCard(
          text: "Total Recovered",
          data: totalRecovered,
        ),
      ],
    );
  }
}
