import 'dart:async';
import 'package:flutter/material.dart';

class LoadingIFMAPage extends StatefulWidget {
  const LoadingIFMAPage({super.key});

  @override
  State<LoadingIFMAPage> createState() => _LoadingIFMAPageState();
}

class _LoadingIFMAPageState extends State<LoadingIFMAPage> {
  int visibleCount = 0;
  late Timer timer;


  final List<_BoxData> boxes = [
    // Pingo do I
    _BoxData(row: 0, col: 0, color: Colors.red),

    // Corpo do I
    _BoxData(row: 1, col: 0, color: Colors.green),
    _BoxData(row: 2, col: 0, color: Colors.green),
    _BoxData(row: 3, col: 0, color: Colors.green),


    // Topo do F
    _BoxData(row: 0, col: 1, color: Colors.green),
    _BoxData(row: 0, col: 2, color: Colors.green),

    // Meio do F
    _BoxData(row: 1, col: 1, color: Colors.green),
    _BoxData(row: 1, col: 0, color: Colors.green),

    // Base do F
    _BoxData(row: 2, col: 1, color: Colors.green),
    _BoxData(row: 2, col: 2, color: Colors.green),

    _BoxData(row: 3, col: 1, color: Colors.green),
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      setState(() {
        visibleCount++;
        if (visibleCount > boxes.length) {
          visibleCount = 0; // reinicia animação
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              height: 200,
              child: Stack(
                children: List.generate(boxes.length, (index) {
                  final box = boxes[index];

                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: box.col * 45,
                    top: box.row * 45,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: index < visibleCount ? 1 : 0,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: box.color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Carregando...",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class _BoxData {
  final int row;
  final int col;
  final Color color;

  _BoxData({
    required this.row,
    required this.col,
    required this.color,
  });
}
