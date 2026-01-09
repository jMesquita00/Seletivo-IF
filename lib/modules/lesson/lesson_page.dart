import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'lesson_model.dart';
import 'package:seletivo_if/modules/services/lesson_service.dart';
import 'pdf_view_screen.dart';

class LessonPage extends StatefulWidget {
  final String lessonId;
  final String subjectId;

  const LessonPage({
    super.key,
    required this.lessonId,
    required this.subjectId,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final LessonService service = LessonService();
  late Future<Lesson> lessonFuture;

  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();

    lessonFuture = service.getLesson(
      lessonId: widget.lessonId,
      subjectId: widget.subjectId,
    );

    lessonFuture.then((lesson) {
      final videoId = YoutubePlayer.convertUrlToId(lesson.videoUrl);

      if (videoId != null) {
        _youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
        );
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
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
        backgroundColor: const Color(0xff319945),
        leading: const BackButton(),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: FutureBuilder<Lesson>(
        future: lessonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Erro: ${snapshot.error}"));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("Nenhuma aula encontrada"));
          }

          final lesson = snapshot.data!;

          return SingleChildScrollView(
            child: Column(
              children: [
                /// VÍDEO YOUTUBE
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.black,
                  child: _youtubeController != null
                      ? YoutubePlayer(
                          controller: _youtubeController!,
                          showVideoProgressIndicator: true,
                          progressIndicatorColor: Colors.red,
                        )
                      : const Center(
                          child: Text(
                            "Vídeo indisponível",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                ),

                const SizedBox(height: 20),

                /// TÍTULO
                Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xff319945), width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      lesson.title,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                /// BOTÕES
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Aula anterior"),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text("Próxima aula"),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// MATERIAIS
                Padding(
                  padding: const EdgeInsets.all(12),
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
                      const SizedBox(height: 10),
                      ...lesson.materials.map(
                        (material) => ListTile(
                          leading: const Icon(
                            Icons.picture_as_pdf,
                            color: Color(0xffFF3B30),
                          ),
                          title: Text(material.name),
                          trailing: const Icon(
                            Icons.download,
                            color: Color(0xff319945),
                          ),
                          onTap: () {
                            _openMaterial(context, material);
                          },
                        ),
                      ),
                    ],
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

void _openMaterial(BuildContext context, MaterialItem material) {
  if (material.fileUrl.isEmpty) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Arquivo não disponível')));
    return;
  }

  // PDF
  if (material.fileUrl.toLowerCase().endsWith('.pdf')) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PdfViewerScreen(pdfUrl: material.fileUrl),
      ),
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text('Tipo de arquivo não suportado')),
  );
}
