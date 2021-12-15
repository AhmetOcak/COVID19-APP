class CoronaNewsModel {
  final String? url;
  final String? description;
  final String? image;
  final String? name;
  final String? source;

  CoronaNewsModel({
    this.url,
    this.description,
    this.image,
    this.name,
    this.source,
  });

  factory CoronaNewsModel.fromJson(Map<String, dynamic> json) {
    final url = json["result"][0]["url"].toString();
    final description = json["result"][0]["description"].toString();
    final image = json["result"][0]["image"].toString();
    final name = json["result"][0]["name"].toString();
    final source = json["result"][0]["source"].toString();

    return CoronaNewsModel(
      url: url,
      description: description,
      image: image,
      name: name,
      source: source,
    );
  }
}
