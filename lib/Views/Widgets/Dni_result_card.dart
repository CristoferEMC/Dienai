import 'package:flutter/material.dart';

class DniResultCard extends StatelessWidget {
  final String? errorMessage;
  final bool isFixedDni;
  final Map<String, dynamic>? fixedPersonaData;
  final dynamic persona;

  const DniResultCard({
    super.key,
    required this.errorMessage,
    required this.isFixedDni,
    required this.fixedPersonaData,
    required this.persona,
  });

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0F172A);
    const Color wineRed = Color(0xFF7A1C2E);

    return Column(
      children: [
        // Mensaje de error con fondo rojo y letras blancas
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: (errorMessage != null && !isFixedDni)
              ? Container(
            key: const ValueKey('errorBox'),
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE60000), // 👈 Fondo rojo
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Icon(Icons.error_outline, color: Colors.white), // 👈 Icono blanco
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    errorMessage!,textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.white, // 👈 Letras blancas
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          )
              : const SizedBox.shrink(),
        ),

        // Resultados de la consulta
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          child: (persona != null || isFixedDni)
              ? Container(
            key: const ValueKey('resultBox'),
            margin: const EdgeInsets.only(top: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white, // Fondo blanco del card principal
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [darkBlue, wineRed],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Centra el texto y el icono
                    children: const [
                      Icon(Icons.verified_user_outlined, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Datos Encontrados',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                if (isFixedDni && fixedPersonaData != null) ...[
                  _buildDetailRow('Número DNI', fixedPersonaData!['dni']),
                  _buildDetailRow('Nombre Completo', fixedPersonaData!['nombreCompleto']),
                  _buildDetailRow('Edad', fixedPersonaData!['edad']),
                  _buildDetailRow('Digito Verificación', fixedPersonaData!['digitoVerificacion']),
                ] else if (persona != null) ...[
                  _buildDetailRow('Número DNI', persona!.dni),
                  _buildDetailRow('Nombres', persona!.nombres),
                  _buildDetailRow('Apellido Paterno', persona!.apellidoPaterno),
                  _buildDetailRow('Apellido Materno', persona!.apellidoMaterno),
                ],
              ],
            ),
          )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF0F172A),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}