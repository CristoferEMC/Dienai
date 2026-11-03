import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/persona_model.dart';

class DniViewModel extends ChangeNotifier {
  static const String _baseUrl = 'https://api.apis.net.pe/v2/reniec/dni';
  static const String _token = ''; // Reemplaza con tu token real

  PersonaDni? persona;
  bool isLoading = false;
  String? errorMessage;

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
      final url = Uri.parse('$_baseUrl?numero=$dni');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        persona = PersonaDni.fromJson(data);
      } else if (response.statusCode == 404) {
        errorMessage = 'DNI no encontrado.';
      } else {
        errorMessage = 'Error en la consulta (${response.statusCode}).';
      }
    } catch (e) {
      errorMessage = 'Error de conexión o red.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
