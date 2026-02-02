class Project {
  final String title;
  final String description;
  final String imagePath; // Asset path or network url
  final List<String> techStack;
  final String? playStoreUrl;
  final String? appStoreUrl;

  Project({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.techStack,
    this.playStoreUrl,
    this.appStoreUrl,
  });
}
