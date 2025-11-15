class AuthErrorMapper {
  static String mapError(String code) {
    switch (code) {
      case "invalid-email":
        return "El correo ingresado no es válido.";

      case "user-disabled":
        return "Esta cuenta ha sido deshabilitada.";

      case "user-not-found":
        return "No existe un usuario con ese correo.";

      case "wrong-password":
        return "La contraseña es incorrecta.";

      case "email-already-in-use":
        return "Este correo ya está registrado.";

      case "weak-password":
        return "La contraseña es demasiado débil.";

      case "operation-not-allowed":
        return "Este tipo de inicio de sesión no está habilitado.";

      case "too-many-requests":
        return "Demasiados intentos. Inténtalo más tarde.";

      case "invalid-credential":
        return "El correo o la contraseña son incorrectos.";

      case "username-taken":
        return "El nombre de usuario ya esta en uso.";

      default:
        return "Ha ocurrido un error inesperado.";
    }
  }
}
