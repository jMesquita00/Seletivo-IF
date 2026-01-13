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

  // Recebe os dados do Firebase (map) e o ID do documento
  factory Lesson.fromMap(Map<String, dynamic> map, String docId) {
    return Lesson(
      id: docId,
      title: map['title'] ?? '',
      videoUrl: map['videoUrl'] ?? '',

      // Converte a lista de Maps do Firebase em uma lista de objetos MaterialItem
      materials: (map['materials'] as List? ?? [])
          .map((item) => MaterialItem.fromMap(item as Map<String, dynamic>))
          .toList(),
    );
  }

}

class MaterialItem {
  final String name;
  final String fileUrl;

  MaterialItem({
    required this.name,
    required this.fileUrl,
  });

  factory MaterialItem.fromMap(Map<String, dynamic> map) {
    return MaterialItem(
      name: map['name'] ?? '',
      fileUrl: map['fileUrl'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'fileUrl': fileUrl,
    };
  }
}