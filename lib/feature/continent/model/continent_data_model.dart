class ContinentDataModel {
  final List<Result>? result;

  ContinentDataModel({
    this.result,
  });

  factory ContinentDataModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['result'] as List;
    List<Result> resultList = list.map((e) => Result.fromJson(e)).toList();
    return ContinentDataModel(
      result: resultList,
    );
  }
}

class Result {
  final String? continent;
  final String? totalCases;
  final String? newCases;
  final String? totalDeaths;
  final String? newDeaths;
  final String? totalRecovered;
  final String? activeCases;

  Result({
    this.continent,
    this.totalCases,
    this.newCases,
    this.totalDeaths,
    this.newDeaths,
    this.totalRecovered,
    this.activeCases,
  });

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    return Result(
      continent: parsedJson['continent'].toString(),
      totalCases: parsedJson['totalCases'].toString(),
      newCases: parsedJson['newCases'].toString(),
      totalDeaths: parsedJson['totalDeaths'].toString(),
      newDeaths: parsedJson['newDeaths'].toString(),
      totalRecovered: parsedJson['totalRecovered'].toString(),
      activeCases: parsedJson['activeCases'].toString(),
    );
  }
}
