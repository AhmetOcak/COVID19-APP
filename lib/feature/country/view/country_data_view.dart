import 'package:covid19_app/core/components/spinkit/spinkit.dart';
import 'package:covid19_app/core/constants/colors.dart';
import 'package:covid19_app/feature/country/model/countries_data_model.dart';
import 'package:covid19_app/feature/country/model/country_data_card.dart';
import 'package:covid19_app/feature/country/service/countries_data_service.dart';
import 'package:flutter/material.dart';

class CountryDataScreen extends StatefulWidget {
  const CountryDataScreen({Key? key}) : super(key: key);

  @override
  _CountryDataScreenState createState() => _CountryDataScreenState();
}

class _CountryDataScreenState extends State<CountryDataScreen> {
  CountriesModel _countriesModel = CountriesModel();
  final GetCountriesData _getCountriesData = GetCountriesData();

  int listLength = 0;
  bool dataCheck = false;

  Future<CountriesModel> getCountriesData() async {
    CountriesModel countriesModel = await _getCountriesData.loadData();
    _countriesModel = countriesModel;
    return _countriesModel;
  }

  @override
  void initState() {
    super.initState();
    getCountriesData().then((value) => setState(() {
          listLength = _countriesModel.result!.length;
          dataCheck = true;
        }));
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
          return CountryDataCard(
            country: _countriesModel.result![index].country.toString(),
            activeCases: _countriesModel.result![index].activeCases.toString(),
            newCases: _countriesModel.result![index].newCases.toString(),
            newDeaths: _countriesModel.result![index].newDeaths.toString(),
            totalCases: _countriesModel.result![index].totalCases.toString(),
            totalDeaths: _countriesModel.result![index].totalDeaths.toString(),
            totalRecovered:
                _countriesModel.result![index].totalRecovered.toString(),
          );
        },
      ),
    );
  }
}
