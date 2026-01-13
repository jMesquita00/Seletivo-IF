import 'package:seletivo_if/modules/study_progress.dart';

class ProgressService {
  Future<StudyProgress> getProgress() async {
    await Future.delayed(const Duration(milliseconds: 600));

    // 👉 Usuário NOVO (sem estudos)
    return StudyProgress.empty();

    // 👉 Usuário COM estudos (exemplo futuro)
    /*
    return StudyProgress(
      hasAnyStudy: true,
      subject: 'Português',
      lessonTitle: 'Concordância Verbal',
      lessonId: 'pt-001',
    );
    */
  }
}

