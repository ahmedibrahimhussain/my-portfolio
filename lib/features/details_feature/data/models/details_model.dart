class DetailsModel {
  final String name;
  final String description;
  final String coverImage;
  final List<String> appImages;

  DetailsModel({
    required this.name,
    required this.description,
    required this.coverImage,
    required this.appImages,
  });

  factory DetailsModel.fromMap(Map<String, dynamic> data) {
    return DetailsModel(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      coverImage: data['coverImage'] ?? '',
      appImages: List<String>.from(data['App Images'] ?? []),
    );
  }
}
