import 'package:flutter/material.dart';
import 'package:rtu_wimpillay/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  Future<void> _signInWithGoogle() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final user = await _authService.signInWithGoogle();

      if (user != null) {
        // ✅ Login exitoso - navegar a home
        print('Usuario logeado: ${user.displayName}');
        // Aquí puedes navegar a tu pantalla principal
        // Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Usuario canceló el login
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Inicio de sesión cancelado'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (error) {
      // Error en el login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al iniciar sesión: $error'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo o imagen de tu app
            FlutterLogo(size: 100),
            SizedBox(height: 50),

            // Título
            Text(
              'RTU Wimpillay',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Inicia sesión para continuar',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 40),

            // Botón de Google Sign-In
            if (_isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _signInWithGoogle,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/google_logo.png', // Añade este asset
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(width: 10),
                    Text('Iniciar sesión con Google'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
