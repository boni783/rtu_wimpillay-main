import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'pasajeros.dart';

class EscaneoPasajero extends StatelessWidget {
  const EscaneoPasajero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Escanear QR del chofer')),
      body: MobileScanner(
        onDetect: (capture) {
          final codigo = capture.barcodes.first.rawValue ?? '';
          Navigator.push(context,
            MaterialPageRoute(builder: (_) => Pasajeros(qrChofer: codigo)));
        },
      ),
    );
  }
}
