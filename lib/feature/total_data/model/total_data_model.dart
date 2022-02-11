class TotalDataModel {
  final String? totalDeaths;
  final String? totalCases;
  final String? totalRecovered;

  TotalDataModel({
    this.totalDeaths,
    this.totalCases,
    this.totalRecovered,
  });

  factory TotalDataModel.fromJson(Map<String, dynamic> json) {
    final totalDeaths = json["result"]["totalDeaths"].toString();
    final totalCases = json["result"]["totalCases"].toString();
    final totalRecovered = json["result"]["totalRecovered"].toString();

    return TotalDataModel(
      totalDeaths: totalDeaths,
      totalCases: totalCases,
      totalRecovered: totalRecovered,
    );
  }
}
