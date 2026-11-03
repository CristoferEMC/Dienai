import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/persona_model.dart';

class DniService {
  static const String _baseUrl = 'https://api.apis.net.pe/v2/reniec/dni';
  static const String _token = 'TU_TOKEN_AQUI';

  Future<PersonaDni?> consultar(String dni) async {
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
      return PersonaDni.fromJson(data);
    } else if (response.statusCode == 404) {
      throw Exception('DNI no encontrado.');
    } else {
      throw Exception('Error al consultar el servicio.');
    }
  }
}
