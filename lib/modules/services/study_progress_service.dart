import 'package:seletivo_if/modules/lesson/study_progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudyProgressService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveProgress({
    required String userId,
    required String subjectId,
    required String subjectName,
    required String lessonId,
    required String lessonTitle,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('studyProgress')
        .doc(subjectId)
        .set({
          'subject': subjectName,
          'subjectId': subjectId,
          'lessonId': lessonId,
          'lessonTitle': lessonTitle,
          'updatedAt': FieldValue.serverTimestamp(),
        });
  }

  Future<StudyProgress?> getProgress(String userId, String subjectId) async {
    final doc = await _firestore
        .collection('users')
        .doc(userId)
        .collection('studyProgress')
        .doc(subjectId)
        .get();

    if (!doc.exists) return null;

    return StudyProgress.fromMap(doc.data()!);
  }
}
