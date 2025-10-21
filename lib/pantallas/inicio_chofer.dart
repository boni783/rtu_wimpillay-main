import 'package:flutter/material.dart';
import 'escaneo_chofer.dart';

class InicioChofer extends StatelessWidget {
  const InicioChofer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Modo Chofer - Wimpillay', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const EscaneoChofer()));
              },
              child: const Text('Escanear ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
