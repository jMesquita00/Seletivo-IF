import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'lesson_model.dart';
import 'package:seletivo_if/modules/services/lesson_service.dart';

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

  VideoPlayerController? _controller;
  Future<void>? _initializeVideoPlayerFuture;
  bool _isVideoInitialized = false;

  @override
  void initState() {
    super.initState();

    // Carrega os dados da aula
    lessonFuture = service.getLesson(
      lessonId: widget.lessonId,
      subjectId: widget.subjectId,
    );
  }

  // Função para inicializar o vídeo quando os dados chegarem
  void _initializeVideo(String videoUrl) {
    _controller?.dispose(); // Dispose do controller anterior se existir

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(videoUrl),
    );

    _initializeVideoPlayerFuture = _controller!.initialize().then((_) {
      setState(() {
        _isVideoInitialized = true;
      });
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
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
          // Estados de carregamento/erro
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

          // Inicializa o vídeo se ainda não foi inicializado
          if (_controller == null && lesson.videoUrl.isNotEmpty) {
            _initializeVideo(lesson.videoUrl);
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// VÍDEO
                Container(
                  height: 250,
                  width: double.infinity,
                  color: const Color(0xffD9D9D9),
                  child: _controller != null && _isVideoInitialized
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            AspectRatio(
                              aspectRatio: _controller!.value.aspectRatio,
                              child: VideoPlayer(_controller!),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: IconButton(
                                icon: Icon(
                                  _controller!.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _controller!.value.isPlaying
                                        ? _controller!.pause()
                                        : _controller!.play();
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 10),
                              Text("Carregando vídeo..."),
                            ],
                          ),
                        ),
                ),

                const SizedBox(height: 20),

                /// TÍTULO DA AULA
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                    side: const BorderSide(color: Color(0xff319945), width: 2),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      lesson.title, // Título do Firestore
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
                          foregroundColor: Colors.black,
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
