import 'package:flutter/material.dart';
import 'escaneo_pasajero.dart';
import 'registro_usuario.dart';

class InicioPasajero extends StatelessWidget {
  const InicioPasajero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Bienvenido a Wimpillay', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const EscaneoPasajero()));
                },
                child: const Text('Escanear QR del chofer'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const RegistroUsuario()));
                },
                child: const Text('Ingresar datos manualmente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
