class DeveloperStatsModel {
  final int experienceYears;
  final int mobileApps;
  final int webProjects;

  DeveloperStatsModel({
    required this.experienceYears,
    required this.mobileApps,
    required this.webProjects,
  });

  factory DeveloperStatsModel.fromJson(Map<String, dynamic> json) {
    return DeveloperStatsModel(
      experienceYears: json['experienceYears'] ?? 0,
      mobileApps: json['mobileApps'] ?? 0,
      webProjects: json['webProjects'] ?? 0,
    );
  }
}
