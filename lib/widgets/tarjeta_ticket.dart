import 'package:flutter/material.dart';

class TarjetaTicket extends StatelessWidget {
  final String nombre;
  final String apellido;
  final String dni;
  final String codigoQR;

  const TarjetaTicket({
    super.key,
    required this.nombre,
    required this.apellido,
    required this.dni,
    required this.codigoQR,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: $nombre'),
            Text('Apellido: $apellido'),
            Text('DNI: $dni'),
            Text('Código QR: $codigoQR'),
          ],
        ),
      ),
    );
  }
}
