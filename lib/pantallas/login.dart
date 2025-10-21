import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instancia de GoogleSignIn - CORREGIDO
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Método para iniciar sesión con Google - CORREGIDO
  Future<User?> signInWithGoogle() async {
    try {
      // Iniciar el flujo de Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null; // Usuario canceló el login
      }

      // Obtener los detalles de autenticación - CORREGIDO
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Crear credencial de Firebase - CORREGIDO
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.,
        idToken: googleAuth.idToken,
      );

      // Iniciar sesión en Firebase con la credencial de Google
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (error) {
      print("Error en Google Sign-In: $error");
      return null;
    }
  }

  // Método para cerrar sesión
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Verificar si hay un usuario logeado
  User? get currentUser => _auth.currentUser;
}
