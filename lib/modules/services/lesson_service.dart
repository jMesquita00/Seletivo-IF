import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:seletivo_if/modules/lesson/lesson_model.dart';

class LessonService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Lesson>> getLessonsBySubject(String subjectId) async {
    final snapshot = await _firestore
        .collection('subject')
        .doc(subjectId)
        .collection('aulas')
        .get();

    return snapshot.docs
        .map((doc) => Lesson.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<Lesson> getLesson({
    required String subjectId,
    required String lessonId,
  }) async {
    final doc = await _firestore
        .collection('subject')
        .doc(subjectId)
        .collection('aulas')
        .doc(lessonId)
        .get();

    if (!doc.exists) {
      throw Exception('Aula não encontrada');
    }

    return Lesson.fromMap(doc.data()!, doc.id);
  }
}
