class CountriesModel {
  final String? country;
  final String? totalCases;
  final String? newCases;
  final String? totalDeaths;
  final String? newDeaths;
  final String? totalRecovered;
  final String? activeCases;

  CountriesModel({
    this.country,
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json, String countryName) {
    final country = json["result"][0]["country"].toString();
    final totalCases = json["result"][0]["totalCases"].toString();
    final newCases = json["result"][0]["newCases"].toString();
    final totalDeaths = json["result"][0]["totalDeaths"].toString();
    final newDeaths = json["result"][0]["newDeaths"].toString();
    final totalRecovered = json["result"][0]["totalRecovered"].toString();
    final activeCases = json["result"][0]["activeCases"].toString();

    return CountriesModel(
      country: country,
      totalCases: totalCases,
      newCases: newCases,
      totalDeaths: totalDeaths,
      newDeaths: newDeaths,
      totalRecovered: totalRecovered,
      activeCases: activeCases,
    );
  }
}
