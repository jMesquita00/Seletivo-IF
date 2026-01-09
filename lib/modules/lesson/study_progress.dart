class StudyProgress {
  final String? subject;
  final String? subjectId;
  final String? lessonId;
  final String? lessonTitle;

  StudyProgress({
    this.subject,
    this.subjectId,
    this.lessonId,
    this.lessonTitle,
  });

  bool get hasAnyStudy =>
      subject != null &&
      subjectId != null &&
      lessonId != null &&
      lessonTitle != null;

  factory StudyProgress.empty() {
    return StudyProgress();
  }

  factory StudyProgress.fromMap(Map<String, dynamic> map) {
    return StudyProgress(
      subject: map['subject'],
      subjectId: map['subjectId'],
      lessonId: map['lessonId'],
      lessonTitle: map['lessonTitle'],
    );
  }
}
