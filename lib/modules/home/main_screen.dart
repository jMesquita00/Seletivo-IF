import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/home/home_screen.dart';
import 'package:seletivo_if/modules/simulated/simulated_inf.dart';
import 'package:seletivo_if/modules/auth/profale_page.dart';
import 'package:seletivo_if/modules/lesson/lesson_list_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;
  final String? lessonId;

  const MainScreen({super.key, this.initialIndex = 0, this.lessonId});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTap(int index) {
    _pageController.jumpToPage(index);
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const BouncingScrollPhysics(), // swipe suave
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: [
          const HomeScreen(),
          LessonsListScreen(),
          const SimulatedInf(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        selectedItemColor: const Color(0xff319945),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: "Aulas"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Simulado"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}
