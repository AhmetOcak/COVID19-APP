class CoronaNewsModel {
  final List<Result>? result;

  CoronaNewsModel({
    this.result,
  });

  factory CoronaNewsModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['result'] as List;
    List<Result> resultList = list.map((e) => Result.fromJson(e)).toList();
    return CoronaNewsModel(
      result: resultList,
    );
  }
}

class Result {
  final String? url;
  final String? description;
  final String? image;
  final String? name;
  final String? source;

  Result({
    this.url,
    this.description,
    this.image,
    this.name,
    this.source,
  });

  factory Result.fromJson(dynamic parsedJson) {
    final url = parsedJson["url"].toString();
    final description = parsedJson["description"].toString();
    final image = parsedJson["image"].toString();
    final name = parsedJson["name"].toString();
    final source = parsedJson["source"].toString();

    return Result(
      url: url,
      description: description,
      image: image,
      name: name,
      source: source,
    );
  }
}
