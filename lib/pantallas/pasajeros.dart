import 'package:flutter/material.dart';
import 'pago.dart';

class Pasajeros extends StatefulWidget {
  final String qrChofer;
  const Pasajeros({super.key, required this.qrChofer});

  @override
  State<Pasajeros> createState() => _PasajerosState();
}

class _PasajerosState extends State<Pasajeros> {
  final controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cantidad de pasajeros')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controlador,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Cantidad'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final cantidad = int.tryParse(controlador.text) ?? 1;
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => Pago(cantidad: cantidad)));
              },
              child: const Text('Pagar ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
