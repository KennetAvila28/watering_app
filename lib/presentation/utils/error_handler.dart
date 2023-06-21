import 'package:watering_system/infrastructure/architecture/data/base_error.dart';

class FirebaseErrorResponse extends BaseError<String> {
  FirebaseErrorResponse({required super.message});

  String errorMessage() {
    switch (message) {
      case "internal-error":
        return "Error en el servidor";
      case "user-not-found":
        return "Usuario no encontrado";
      case "user-disabled":
        return "El usuario se encuentra deshabilitado";
      case "network-request-failed":
        return "Usted no esta conectado a internet";
      case "wrong-password":
        return "Correo y/o contraseña incorrectos";
      case "email-already-in-use":
        return "Este correo ya se encuentra registrado";
      case "weak-password":
        return "Contraseña debíl";
      case "required-fields":
        return "Todos los campos son requeridos";
      default:
        return "Error Desconocido";
    }
  }
}
