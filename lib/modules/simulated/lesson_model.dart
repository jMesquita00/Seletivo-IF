class Lesson {
  final String id;
  final String title;
  final String videoUrl;
  final List<MaterialItem> materials;

  Lesson({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.materials,
  });
}

class MaterialItem {
  final String name;
  final String fileUrl;

  MaterialItem({
    required this.name,
    required this.fileUrl,
  });
}
