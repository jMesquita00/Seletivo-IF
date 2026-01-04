import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/home/home_empty_state.dart';
import 'package:seletivo_if/modules/study_progress.dart';
import 'package:seletivo_if/modules/services/progress_service.dart';
import 'package:seletivo_if/modules/home/home_with_progress.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final ProgressService progressService = ProgressService();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: FutureBuilder<StudyProgress>(
        future: progressService.getProgress(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final progress = snapshot.data!;

          // 🔥 DECISÃO AQUI
          if (!progress.hasAnyStudy) {
            return const HomeEmptyState();
          }

          return HomeWithProgress(progress: progress);
        },
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, size.height - 80);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 20,
      size.width,
      size.height - 80,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
