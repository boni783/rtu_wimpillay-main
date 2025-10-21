import 'package:flutter/material.dart';
import 'ticket.dart';

class Pago extends StatelessWidget {
  final int cantidad;
  const Pago({super.key, required this.cantidad});

  @override
  Widget build(BuildContext context) {
    final monto = cantidad * 1.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Pago')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Monto total: \$${monto.toStringAsFixed(2)}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const Ticket()));
              },
              child: const Text('Generar ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
