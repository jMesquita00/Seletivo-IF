import 'package:flutter/material.dart';
// import 'package:seletivo_if/modules/home/main_screen.dart';
import 'package:seletivo_if/modules/lesson/lesson_page.dart';
import 'package:seletivo_if/modules/services/lesson_service.dart';
import 'package:seletivo_if/modules/lesson/lesson_model.dart';

// Enum para as matérias
enum Subject { portuguese, math }

class LessonsListScreen extends StatefulWidget {
  const LessonsListScreen({super.key});

  @override
  State<LessonsListScreen> createState() => _LessonsListScreenState();
}

class _LessonsListScreenState extends State<LessonsListScreen> {
  Subject selectedSubject = Subject.portuguese;
  final LessonService _lessonService = LessonService();

  String get subjectId => selectedSubject == Subject.portuguese
      ? 'TIFQELRQKWipy2kmcaxw'
      : 'X2FS62EujxD7bcASs2mz';

  String get subjectTitle =>
      selectedSubject == Subject.portuguese ? 'portugues' : 'matematica';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Aulas",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xff319945),
      ),
      body: Column(
        children: [
          _buildSubjectFilter(),
          _buildSubjectTitle(),
          _buildLessonsList(),
        ],
      ),
    );
  }

  Widget _buildSubjectFilter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Escolha a matéria:',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _SubjectFilterButton(
                  label: 'Português',
                  icon: Icons.menu_book,
                  isSelected: selectedSubject == Subject.portuguese,
                  onTap: () {
                    setState(() {
                      selectedSubject = Subject.portuguese;
                    });
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SubjectFilterButton(
                  label: 'Matemática',
                  icon: Icons.calculate,
                  isSelected: selectedSubject == Subject.math,
                  onTap: () {
                    setState(() {
                      selectedSubject = Subject.math;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubjectTitle() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          subjectTitle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildLessonsList() {
    return Expanded(
      child: FutureBuilder<List<Lesson>>(
        future: _lessonService.getLessonsBySubject(subjectId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Erro ao carregar aulas'));
          }

          final lessons = snapshot.data ?? [];

          if (lessons.isEmpty) {
            return const Center(
              child: Text(
                'Nenhuma aula disponível',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: lessons.length,
            itemBuilder: (context, index) {
              final lesson = lessons[index];

              return _LessonCard(
                number: (index + 1).toString().padLeft(2, '0'),
                title: lesson.title,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          LessonPage(lessonId: lesson.id, subjectId: subjectId),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

// Widget do botão de filtro
class _SubjectFilterButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _SubjectFilterButton({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? const Color(0xff319945) : Colors.grey[200],
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey[700],
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[700],
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget do Card de Aula
class _LessonCard extends StatelessWidget {
  final String number;
  final String title;
  final VoidCallback onTap;

  const _LessonCard({
    required this.number,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xffE8E8E8),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Número da aula
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    number,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff319945),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Título e subtítulo
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // Botão Play
                Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: Color(0xff319945),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
