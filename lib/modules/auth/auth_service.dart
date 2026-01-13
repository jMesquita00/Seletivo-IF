import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> login({
    required String email,
    required String senha,
  }) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }

  // 🔹 NOVO: criar conta
  Future<UserCredential> criarConta({
    required String email,
    required String senha,
  }) async {
    return await _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }
}
