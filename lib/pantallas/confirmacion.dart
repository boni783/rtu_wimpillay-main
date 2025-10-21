import 'package:flutter/material.dart';

class Confirmacion extends StatelessWidget {
  final bool valido;
  const Confirmacion({super.key, required this.valido});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirmación')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              valido ? Icons.check_circle : Icons.cancel,
              color: valido ? Colors.green : Colors.red,
              size: 100,
            ),
            const SizedBox(height: 20),
            Text(
              valido ? 'Ticket válido' : 'Ticket inválido',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
