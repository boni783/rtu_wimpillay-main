import 'package:flutter/material.dart';
import '../firebase_service.dart';

class Ticket extends StatelessWidget {
  const Ticket({super.key});

  @override
  Widget build(BuildContext context) {
    final servicio = ServicioFirebase();

    return Scaffold(
      appBar: AppBar(title: const Text('Ticket generado')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text('Nombre: José'),
            const Text('Apellido: Wimpillay'),
            const Text('DNI: 12345678'),
            const SizedBox(height: 20),
            const Text('Código QR: generado'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                servicio.crearTicket(
                  nombre: 'José',
                  apellido: 'Wimpillay',
                  dni: '12345678',
                  cantidad: 1,
                  monto: 1.0,
                );
              },
              child: const Text('Tomar'),
            ),
          ],
        ),
      ),
    );
  }
}
