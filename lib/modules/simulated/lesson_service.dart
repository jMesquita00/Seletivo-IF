import 'lesson_model.dart';

class LessonService {
  Future<Lesson> getLesson(String lessonId) async {
    // Simulação de carregamento do banco
    await Future.delayed(const Duration(seconds: 1));

    return Lesson(
      id: lessonId,
      title: "Aula 1.1 - Concordância verbal e nominal",
      videoUrl: "https://meuvideo.com/video.mp4",
      materials: [
        MaterialItem(
          name: "Apresentação da aula",
          fileUrl: "https://meuarquivo.com/aula1.pdf",
        ),
        MaterialItem(
          name: "Mapa Mental",
          fileUrl: "https://meuarquivo.com/exercicios.pdf",
        ),
        MaterialItem(
          name: "Resumo",
          fileUrl: "https://meuarquivo.com/exercicios.pdf",
        ),
        MaterialItem(
          name: "Exercícios",
          fileUrl: "https://meuarquivo.com/exercicios.pdf",
        ),
        MaterialItem(
          name: "Diagramas",
          fileUrl: "https://meuarquivo.com/exercicios.pdf",
        ),
        MaterialItem(
          name: "Anotaçoes",
          fileUrl: "https://meuarquivo.com/exercicios.pdf",
        ),
      ],
    );
  }
}
