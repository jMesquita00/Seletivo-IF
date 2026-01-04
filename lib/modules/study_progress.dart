class StudyProgress {
  final bool hasAnyStudy;
  final String? subject;
  final String? lessonTitle;
  final String? lessonId;

  StudyProgress({
    required this.hasAnyStudy,
    this.subject,
    this.lessonTitle,
    this.lessonId,
  });

  factory StudyProgress.empty() {
    return StudyProgress(hasAnyStudy: false);
  }
}
