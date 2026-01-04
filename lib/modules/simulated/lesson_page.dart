import 'package:flutter/material.dart';
import 'lesson_model.dart';
import 'lesson_service.dart';
import 'package:seletivo_if/shared/widgets/app_botton_navigation.dart';

class LessonPage extends StatefulWidget {
  final String lessonId;

  const LessonPage({super.key, required this.lessonId});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final LessonService service = LessonService();
  late Future<Lesson> lessonFuture;

  @override
  void initState() {
    super.initState();
    lessonFuture = service.getLesson(widget.lessonId);
  }

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
        backgroundColor: Color(0xff319945),
        leading: const BackButton(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<Lesson>(
        future: lessonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Erro ao carregar aula"));
          }

          final lesson = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// VÍDEO
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Color(0xffD9D9D9),
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.play_circle_filled,
                        size: 60,
                        color: Color(0xff319945),
                      ),
                      Icon(Icons.play_arrow, size: 40, color: Colors.white),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// TÍTULO DA AULA
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: BorderSide(color: Color(0xff319945), width: 2),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      lesson.title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// BOTÕES DE NAVEGAÇÃO
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 14.0,
                          ),
                          side: const BorderSide(
                            color: Color(0xff319945),
                            width: 2,
                          ),
                          foregroundColor: Colors.black,
                        ),

                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Aula anterior"),
                      ),

                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black, // cor do texto e ícone
                          side: const BorderSide(
                            color: Color(0xff319945),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24.0,
                            vertical: 14.0,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text("Próxima aula"),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// MATERIAIS
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xff319945),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Materiais",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 12),

                        SizedBox(
                          height: 200,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: lesson.materials.length,
                            itemBuilder: (context, index) {
                              final material = lesson.materials[index];
                              return ListTile(
                                leading: const Icon(
                                  Icons.picture_as_pdf,
                                  color: Color(0xffFF3B30),
                                ),
                                title: Text(material.name),
                                trailing: IconButton(
                                  icon: const Icon(
                                    Icons.download,
                                    color: Color(0xff319945),
                                  ),
                                  onPressed: () {
                                    // download ou abrir arquivo
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
