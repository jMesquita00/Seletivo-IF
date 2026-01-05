// import 'package:flutter/material.dart';
// import 'package:seletivo_if/modules/auth/createAccountPage.dart';

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         reverse: true,
//         padding: const EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             // ---------- LOGO ----------
//             SizedBox(height: 50),
//             Image.asset('lib/shared/assets/LogoIF.png', width: 140),
//             const SizedBox(height: 10),

//             const SizedBox(height: 24),

//             // -------- TÍTULO --------
//             const Text(
//               "Chegou a hora de começar sua\njornada pro IF!",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: 17,
//                 color: Color(0xFF2E7D32),
//                 fontWeight: FontWeight.w600,
//               ),
//             ),

//             const SizedBox(height: 32),

//             const Text(
//               "Entre para continuar",
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//             ),

//             const SizedBox(height: 16),

//             // -------- CAMPO EMAIL --------
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Email",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // -------- CAMPO SENHA --------
//             TextField(
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: "Senha",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 24),

//             // -------- BOTÃO LOGIN --------
//             SizedBox(
//               width: double.infinity,
//               height: 48,
//               child: ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF2E7D32),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(24),
//                   ),
//                 ),
//                 child: const Text(
//                   "Login",
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 12),

//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "Esqueceu a senha ?",
//                 style: TextStyle(color: Colors.black54),
//               ),
//             ),

//             const SizedBox(height: 8),

//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Ainda não tem conta? "),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const CreatAccountPage(),
//                       ),
//                     );
//                   },
//                   child: const Text(
//                     "criar conta",
//                     style: TextStyle(
//                       color: Colors.blue,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/auth/createAccountPage.dart';
import 'package:seletivo_if/modules/home/homeScreen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),

              // ---------- LOGO ----------
              Image.asset('lib/shared/assets/LogoIF.png', width: 140),
              const SizedBox(height: 24),

              // -------- TÍTULO --------
              const Text(
                "Chegou a hora de começar sua\njornada pro IF!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 32),

              const Text(
                "Entre para continuar",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),

              const SizedBox(height: 16),

              // -------- CAMPO EMAIL --------
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // -------- CAMPO SENHA --------
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // -------- BOTÃO LOGIN --------
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              TextButton(
                onPressed: () {},
                child: const Text(
                  "Esqueceu a senha ?",
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              const SizedBox(height: 8),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Ainda não tem conta? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreatAccountPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "criar conta",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
