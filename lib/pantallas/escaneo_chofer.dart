import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'confirmacion.dart';
import '../firebase_service.dart';

class EscaneoChofer extends StatelessWidget {
  const EscaneoChofer({super.key});

  @override
  Widget build(BuildContext context) {
    final servicio = ServicioFirebase();

    return Scaffold(
      appBar: AppBar(title: const Text('Escanear QR del pasajero')),
      body: MobileScanner(
        onDetect: (capture) async {
          final codigo = capture.barcodes.first.rawValue ?? '';
          final valido = await servicio.validarQR(codigo);
          Navigator.push(context,
            MaterialPageRoute(builder: (_) => Confirmacion(valido: valido)));
        },
      ),
    );
  }
}
