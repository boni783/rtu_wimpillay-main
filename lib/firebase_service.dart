import 'package:cloud_firestore/cloud_firestore.dart';

class ServicioFirebase {
  // ignore: unused_field
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // 🔹 Colección de usuarios
  final CollectionReference _usuariosRef = FirebaseFirestore.instance.collection('usuarios');

  // 🔹 Colección de tickets
  final CollectionReference _ticketsRef = FirebaseFirestore.instance.collection('tickets');

  // ✅ Obtener todos los usuarios
  Future<List<Map<String, dynamic>>> obtenerUsuarios() async {
    try {
      QuerySnapshot snapshot = await _usuariosRef.get();
      return snapshot.docs.map((doc) {
        return {
          'uid': doc.id,
          'dni': doc['dni'],
          'nombre': doc['nombre'],
        };
      }).toList();
    } catch (e) {
      print("Error al obtener usuarios: $e");
      return [];
    }
  }

  // ✅ Agregar usuario
  Future<void> agregarUsuario(String dni, String nombre) async {
    try {
      await _usuariosRef.add({
        'dni': dni,
        'nombre': nombre,
        'fechaCreacion': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error al agregar usuario: $e");
      throw e;
    }
  }

  // ✅ Eliminar usuario
  Future<void> eliminarUsuario(String uid) async {
    try {
      await _usuariosRef.doc(uid).delete();
    } catch (e) {
      print("Error al eliminar usuario: $e");
      throw e;
    }
  }

  // ✅ Actualizar usuario
  Future<void> actualizarUsuario(String uid, String dni, String nombre) async {
    try {
      await _usuariosRef.doc(uid).update({
        'dni': dni,
        'nombre': nombre,
        'fechaActualizacion': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error al actualizar usuario: $e");
      throw e;
    }
  }

  // ✅ Crear ticket
  Future<void> crearTicket({
    required String nombre,
    required String apellido,
    required String dni,
    required int cantidad,
    required double monto,
  }) async {
    try {
      await _ticketsRef.add({
        'nombre': nombre,
        'apellido': apellido,
        'dni': dni,
        'cantidad': cantidad,
        'monto': monto,
        'codigoQR': dni + DateTime.now().millisecondsSinceEpoch.toString(),
        'fecha': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error al crear ticket: $e");
      throw e;
    }
  }

  // ✅ Validar ticket por código QR
  Future<bool> validarQR(String codigoQR) async {
    try {
      final resultado = await _ticketsRef
          .where('codigoQR', isEqualTo: codigoQR)
          .get();
      return resultado.docs.isNotEmpty;
    } catch (e) {
      print("Error al validar QR: $e");
      return false;
    }
  }
}
