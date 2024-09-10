class NameModel {
  final String name;

  NameModel({required this.name});

  factory NameModel.fromJson(dynamic json) {
    final String rawName = json.toString();
    final String cleanedName = rawName.replaceAll('[', '').replaceAll(']', '');
    return NameModel(
      name: cleanedName,
    );
  }
}
