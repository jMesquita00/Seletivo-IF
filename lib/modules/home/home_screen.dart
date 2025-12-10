// // import 'package:flutter/material.dart';
// // import 'package:seletivo_if/shared/widgets/semicirculo.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     double widthScreen = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.start,
// //         children: <Widget>[
// //           Stack(
// //             children: [
// //               Center(
// //                 child: TopSemiCircle(radius: widthScreen, color: Colors.green),
// //               ),

// //               Positioned(
// //                 top: 50,
// //                 left: 0,
// //                 right: 0,
// //                 child: Center(
// //                   child: Image.asset(
// //                     "lib/shared/assets/LogoIfwhite.png",
// //                     // height: 100,
// //                     // width: 100,
// //                   ),
// //                 ),
// //               ),
// //               Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(top: 150),
// //                   child: Text(
// //                     "Olá, usuário",
// //                     style: TextStyle(color: Colors.white, fontSize: 32),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),

// //           Text("Meus estudos"),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:seletivo_if/shared/widgets/card_disciplin.dart';
// import 'package:seletivo_if/shared/widgets/semiC.dart';
// import 'package:seletivo_if/shared/widgets/semicirculo.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     double widthScreen = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Stack(
//             children: [
//               TopHeader(widthScreen: widthScreen),

//               /// Aqui adicionamos "Meus estudos" logo abaixo do semicírculo
//               Padding(
//                 padding: const EdgeInsets.only(top: 250, left: 16),
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Meus estudos",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 300, left: 20, right: 20),

//                 child: CardDisciplina(
//                   name: "Matematica",
//                   color: Colors.black,
//                   text: 'Aula 1.1 - Concordância verbal e nominal',
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.only(top: 500, left: 20, right: 20),
//                 child: CardDisciplina(
//                   name: "Português",
//                   color: Colors.red,
//                   text: 'Aula 2.2 - Equações do segundo grau',
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/auth/profale_page.dart';
import 'package:seletivo_if/modules/simulated/simulated_inf.dart';
import 'package:seletivo_if/shared/widgets/card_disciplin.dart';
import 'package:seletivo_if/shared/widgets/semi_c.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        onTap: (index) {
          switch (index) {
            // case 0:
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SimulatedInf()),
              );
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "Simulado"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: [
              TopHeader(widthScreen: widthScreen),

              Padding(
                padding: const EdgeInsets.only(top: 250, left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Meus estudos",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 300, left: 20, right: 20),
                child: CardDisciplina(
                  name: "Português",
                  color: Colors.orangeAccent,
                  text: 'Aula 1.1 - Concordância verbal e nominal',
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 500, left: 20, right: 20),
                child: CardDisciplina(
                  name: "Matemática",
                  color: Colors.blueAccent,
                  text: 'Aula 2.2 - Equações do segundo grau',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
