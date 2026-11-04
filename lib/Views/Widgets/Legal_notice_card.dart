import 'package:flutter/material.dart';

class LegalNoticeCard extends StatelessWidget {
  const LegalNoticeCard({super.key});

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0F172A);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: darkBlue, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Importante: El resultado es referencial y no constituye por sí solo una verificación oficial de identidad. Comprueba que el número de DNI ingresado sea correcto y utiliza la información responsablemente.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
                height: 1.4,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}