import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:seletivo_if/modules/auth/login_screen.dart';
import 'package:seletivo_if/modules/splash/notification_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 280,
            child: Stack(
              children: [
                ClipPath(
                  clipper: HeaderClipper(),
                  child: Container(height: 230, color: const Color(0xff319945)),
                ),

                // Avatar
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 140,
                          height: 140,
                          decoration: const BoxDecoration(
                            color: Color(0xFF8C8C8C),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            size: 100,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: Colors.black26,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 Nome genérico (pode melhorar depois)
          const Text(
            "Usuário",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          // 🔹 EMAIL REAL DO FIREBASE
          Text(
            user?.email ?? 'Email não disponível',
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF8C8C8C),
            ),
          ),

          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.person_outline,
                  text: "Minha Conta",
                  onPressed: () {},
                ),

                _buildMenuItem(
                  icon: Icons.notifications_none,
                  text: "Notificações",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => NotificationScreen(),
                      ),
                    );
                  },
                ),

                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  text: "Ajustes",
                  onPressed: () {},
                ),

                _buildMenuItem(
                  icon: Icons.book_outlined,
                  text: "Termos e Privacidade",
                  onPressed: () {},
                ),

                // 🔴 BOTÃO SAIR (LOGOUT REAL)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();

                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage()),
                            (route) => false,
                      );
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.black,
                      size: 24,
                    ),
                    label: const Text(
                      "Sair",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffFF9191),
                      elevation: 2,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: const Color(0XCCD5D5D5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0XFF319945)),
        title: Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Color(0XFF8C8C8C),
        ),
        onTap: onPressed,
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
