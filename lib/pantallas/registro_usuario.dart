import 'package:flutter/material.dart';
import '../firebase_service.dart';
import 'pasajeros.dart';

class RegistroUsuario extends StatefulWidget {
  const RegistroUsuario({super.key});

  @override
  State<RegistroUsuario> createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {
  final controladorNombre = TextEditingController();
  final controladorDni = TextEditingController();
  final servicio = ServicioFirebase();

  void continuar() async {
    final nombre = controladorNombre.text.trim();
    final dni = controladorDni.text.trim();

    if (nombre.isEmpty || dni.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    await servicio.agregarUsuario(dni, nombre);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Pasajeros(
            qrChofer: dni + DateTime.now().millisecondsSinceEpoch.toString()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de usuario')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controladorNombre,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controladorDni,
              decoration: const InputDecoration(labelText: 'DNI'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: continuar,
              child: const Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
