import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/home/main_screen.dart';

// Enum para as matérias
enum Subject { portuguese, math }

class LessonsListScreen extends StatefulWidget {
  const LessonsListScreen({super.key});

  @override
  State<LessonsListScreen> createState() => _LessonsListScreenState();
}

class _LessonsListScreenState extends State<LessonsListScreen> {
  Subject selectedSubject = Subject.portuguese;

  // Mock de dados - Depois virá do Firebase
  final Map<Subject, List<LessonItem>> mockLessons = {
    Subject.portuguese: [
      LessonItem(
        id: 'port-001',
        number: '01',
        title: 'Interpretação de Texto',
        subtitle: 'Técnicas e estratégias',
      ),
      LessonItem(
        id: 'port-002',
        number: '02',
        title: 'Gramática Básica',
        subtitle: 'Classes gramaticais',
      ),
      LessonItem(
        id: 'port-003',
        number: '03',
        title: 'Concordância Verbal',
        subtitle: 'Regras fundamentais',
      ),
      LessonItem(
        id: 'port-004',
        number: '04',
        title: 'Concordância Nominal',
        subtitle: 'Como aplicar corretamente',
      ),
      LessonItem(
        id: 'port-005',
        number: '05',
        title: 'Ortografia',
        subtitle: 'Principais regras',
      ),
      LessonItem(
        id: 'port-006',
        number: '06',
        title: 'Acentuação Gráfica',
        subtitle: 'Quando acentuar',
      ),
      LessonItem(
        id: 'port-007',
        number: '07',
        title: 'Crase',
        subtitle: 'Uso e aplicação',
      ),
    ],

    Subject.math: [
      LessonItem(
        id: 'math-001',
        number: '01',
        title: 'Operações Básicas',
        subtitle: 'Soma, subtração, multiplicação',
      ),
      LessonItem(
        id: 'math-002',
        number: '02',
        title: 'Frações',
        subtitle: 'Conceitos fundamentais',
      ),
      LessonItem(
        id: 'math-003',
        number: '03',
        title: 'Equações do 1º Grau',
        subtitle: 'Resolução de problemas',
      ),
      LessonItem(
        id: 'math-004',
        number: '04',
        title: 'Geometria Plana',
        subtitle: 'Áreas e perímetros',
      ),
      LessonItem(
        id: 'math-005',
        number: '05',
        title: 'Razão e Proporção',
        subtitle: 'Regra de três',
      ),
      LessonItem(
        id: 'math-006',
        number: '06',
        title: 'Porcentagem',
        subtitle: 'Cálculos práticos',
      ),
      LessonItem(
        id: 'math-007',
        number: '07',
        title: 'Estatística Básica',
        subtitle: 'Média, moda e mediana',
      ),
    ],
  };

  List<LessonItem> get currentLessons => mockLessons[selectedSubject] ?? [];

  String get subjectTitle =>
      selectedSubject == Subject.portuguese ? 'Português' : 'Matemática';

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
          // Filtro de Matérias
          Container(
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
          ),

          // Título da matéria selecionada
          Padding(
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
          ),

          // Lista de Aulas
          Expanded(
            child: currentLessons.isEmpty
                ? const Center(
                    child: Text(
                      'Nenhuma aula disponível',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: currentLessons.length,
                    itemBuilder: (context, index) {
                      final lesson = currentLessons[index];
                      return _LessonCard(
                        lesson: lesson,
                        onTap: () {
                          // Navega para a tela da aula
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MainScreen(
                                initialIndex: 1,
                                lessonId: lesson.id,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
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
  final LessonItem lesson;
  final VoidCallback onTap;

  const _LessonCard({required this.lesson, required this.onTap});

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
                    lesson.number,
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
                        lesson.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        lesson.subtitle,
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
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

// Modelo de dados da aula (simples)
class LessonItem {
  final String id;
  final String number;
  final String title;
  final String subtitle;

  LessonItem({
    required this.id,
    required this.number,
    required this.title,
    required this.subtitle,
  });
}
