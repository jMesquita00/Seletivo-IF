import 'package:flutter/material.dart';
import 'package:seletivo_if/shared/widgets/card_disciplin.dart';
import 'package:seletivo_if/modules/study_progress.dart';

class HomeWithProgress extends StatelessWidget {
  final StudyProgress progress;

  const HomeWithProgress({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardDisciplina(
          name: progress.subject!,
          color: Colors.orangeAccent,
          text: 'Continuar: ${progress.lessonTitle}',
        ),

        // outras disciplinas
      ],
    );
  }
}
