class CountriesModel {
  final List<Result>? result;

  CountriesModel({
    this.result,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['result'] as List;
    List<Result> resultList = list.map((e) => Result.fromJson(e)).toList();
    return CountriesModel(
      result: resultList,
    );
  }
}

class Result {
  final String? country;
  final String? totalCases;
  final String? newCases;
  final String? totalDeaths;
  final String? newDeaths;
  final String? totalRecovered;
  final String? activeCases;

  Result({
    this.country,
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
  });

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    final country = parsedJson["country"].toString();
    final totalCases = parsedJson["totalCases"].toString();
    final newCases = parsedJson["newCases"].toString();
    final totalDeaths = parsedJson["totalDeaths"].toString();
    final newDeaths = parsedJson["newDeaths"].toString();
    final totalRecovered = parsedJson["totalRecovered"].toString();
    final activeCases = parsedJson["activeCases"].toString();

    return Result(
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
