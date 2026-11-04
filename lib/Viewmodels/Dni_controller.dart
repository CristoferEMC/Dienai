import 'package:flutter/material.dart';
// Importa tu modelo de persona si lo tienes ubicado en otra ruta:
// import 'package:dienai/Models/Persona_model.dart';

class DniViewModel extends ChangeNotifier {
  String? errorMessage;
  bool isLoading = false;
  dynamic persona; // Cambia 'dynamic' por tu 'PersonaModel?' si aplica

  Future<void> consultarDni(String dni) async {
    if (dni.length != 8) {
      errorMessage = 'El DNI debe tener exactamente 8 dígitos.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    persona = null;
    notifyListeners();

    try {
      // Simulación de llamada a servicio (reemplaza con tu DniService real)
      await Future.delayed(const Duration(seconds: 1));

      // Ejemplo de error si no encuentra nada
      errorMessage = 'No se encontró a ninguna persona registrada con el DNI ingresado.';
    } catch (e) {
      errorMessage = 'Error de conexión. Verifique su red e intente nuevamente.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> consultarPorNombre(String nombres, String apPaterno, String apMaterno) async {
    if (nombres.isEmpty || apPaterno.isEmpty) {
      errorMessage = 'Debe ingresar al menos el nombre y el apellido paterno.';
      notifyListeners();
      return;
    }

    isLoading = true;
    errorMessage = null;
    persona = null;
    notifyListeners();

    try {
      // Simulación de búsqueda por nombres
      await Future.delayed(const Duration(seconds: 1));

      errorMessage = 'No se encontraron resultados con los nombres y apellidos ingresados.';
    } catch (e) {
      errorMessage = 'Error al procesar la consulta por nombres.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}