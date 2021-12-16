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

  factory CoronaNewsModel.fromJson(dynamic json) {
    final url = json["url"].toString();
    final description = json["description"].toString();
    final image = json["image"].toString();
    final name = json["name"].toString();
    final source = json["source"].toString();

    return CoronaNewsModel(
      url: url,
      description: description,
      image: image,
      name: name,
      source: source,
    );
  }
}
