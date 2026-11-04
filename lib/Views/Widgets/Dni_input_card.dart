import 'package:dienai/Views/Privacy_policy_view.dart';
import 'package:dienai/Views/Terms_conditions_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DniInputCard extends StatefulWidget {
  final TextEditingController dniController;
  final TextEditingController nombreController;
  final TextEditingController apellidoPaternoController;
  final TextEditingController apellidoMaternoController;
  final FocusNode dniFocusNode;
  final bool isComplete;
  final bool isLoading;
  final VoidCallback onConsultar;
  final ValueChanged<bool> onTabChanged;

  const DniInputCard({
    super.key,
    required this.dniController,
    required this.nombreController,
    required this.apellidoPaternoController,
    required this.apellidoMaternoController,
    required this.dniFocusNode,
    required this.isComplete,
    required this.isLoading,
    required this.onConsultar,
    required this.onTabChanged,
  });

  @override
  State<DniInputCard> createState() => _DniInputCardState();
}

class _DniInputCardState extends State<DniInputCard> {
  bool _isDniMode = true;

  final FocusNode _nombreFocusNode = FocusNode();
  final FocusNode _apPaternoFocusNode = FocusNode();
  final FocusNode _apMaternoFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _nombreFocusNode.addListener(() => setState(() {}));
    _apPaternoFocusNode.addListener(() => setState(() {}));
    _apMaternoFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nombreFocusNode.dispose();
    _apPaternoFocusNode.dispose();
    _apMaternoFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0F172A);
    const Color wineRed = Color(0xFF7A1C2E);

    return ListenableBuilder(
      listenable: widget.dniFocusNode,
      builder: (context, child) {
        final bool isDniFocused = widget.dniFocusNode.hasFocus;

        return Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Botones unidos estilo interruptor (Segmented Control)
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    // Botón 1: DNI (Azul)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (!_isDniMode) {
                            setState(() {
                              _isDniMode = true;
                            });
                            widget.onTabChanged(true);
                            // 👈 Oculta el teclado actual para forzar la actualización al cambiar de pestaña
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _isDniMode ? darkBlue : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                          ),
                          child: Text(
                            'Nombre por DNI',
                            style: TextStyle(
                              color: _isDniMode ? Colors.white : Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Botón 2: DNI por Nombre (Rojo Vino)
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          if (_isDniMode) {
                            setState(() {
                              _isDniMode = false;
                            });
                            widget.onTabChanged(false);
                            // 👈 Oculta el teclado actual para forzar la actualización al cambiar de pestaña
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: !_isDniMode ? wineRed : Colors.transparent,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(14),
                              bottomRight: Radius.circular(14),
                            ),
                          ),
                          child: Text(
                            'DNI por Nombre',
                            style: TextStyle(
                              color: !_isDniMode ? Colors.white : Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Renderizado dinámico con Keys únicas para evitar conflicto de teclados
              if (_isDniMode) ...[
                InputDecorator(
                  key: const ValueKey('dniInputDecorator'), // 👈 Clave única para el modo DNI
                  decoration: InputDecoration(
                    labelText: 'Número de DNI',
                    labelStyle: TextStyle(
                      color: isDniFocused ? darkBlue : Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    filled: true,
                    fillColor: const Color(0xFFFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(
                        color: isDniFocused ? darkBlue : Colors.grey.shade400,
                        width: isDniFocused ? 2 : 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: wineRed, width: 2),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  child: TextField(
                    key: const ValueKey('dniTextField'), // 👈 Clave única
                    controller: widget.dniController,
                    focusNode: widget.dniFocusNode,
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    cursorColor: wineRed,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: darkBlue,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      fontSize: 16,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      counterText: '',
                      hintText: '12345678',
                      hintStyle: TextStyle(
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ] else ...[
                _buildCustomTextField(
                  key: const ValueKey('nombreTextField'), // 👈 Clave única
                  controller: widget.nombreController,
                  focusNode: _nombreFocusNode,
                  label: 'Nombres',
                  hint: 'Ej. Juan Carlos',
                  primaryColor: wineRed,
                  darkColor: darkBlue,
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _buildCustomTextField(
                        key: const ValueKey('apPaternoTextField'), // 👈 Clave única
                        controller: widget.apellidoPaternoController,
                        focusNode: _apPaternoFocusNode,
                        label: 'Apellido Paterno',
                        hint: 'Ej. Pérez',
                        primaryColor: wineRed,
                        darkColor: darkBlue,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildCustomTextField(
                        key: const ValueKey('apMaternoTextField'), // 👈 Clave única
                        controller: widget.apellidoMaternoController,
                        focusNode: _apMaternoFocusNode,
                        label: 'Apellido Materno',
                        hint: 'Ej. Gómez',
                        primaryColor: wineRed,
                        darkColor: darkBlue,
                      ),
                    ),
                  ],
                ),
              ],

              const SizedBox(height: 20),

              // Botón de acción con Gradiente
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: (widget.isComplete && !widget.isLoading) ? 1.0 : 0.6,
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: (widget.isComplete && !widget.isLoading)
                        ? const LinearGradient(
                      colors: [darkBlue, wineRed],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    )
                        : null,
                    color: (widget.isComplete && !widget.isLoading) ? null : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ElevatedButton(
                    onPressed: (widget.isComplete && !widget.isLoading) ? widget.onConsultar : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: widget.isLoading
                          ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                          : const Text(
                        'Consultar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                  children: [
                    const TextSpan(text: 'Al consultar, aceptas nuestra '),
                    TextSpan(
                      text: 'Política de Privacidad',
                      style: const TextStyle(
                        color: wineRed,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivacyPolicyView(),
                            ),
                          );
                        },
                    ),
                    const TextSpan(text: ' y '),
                    TextSpan(
                      text: 'Términos y Condiciones',
                      style: const TextStyle(
                        color: wineRed,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TermsConditionsView(),
                            ),
                          );
                        },
                    ),
                    const TextSpan(text: '.'),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomTextField({
    Key? key, // 👈 Recibe la key opcional
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required Color primaryColor,
    required Color darkColor,
  }) {
    final bool isFocused = focusNode.hasFocus;

    return InputDecorator(
      key: key, // 👈 Asigna la key al decorador
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: isFocused ? primaryColor : Colors.grey.shade600,
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(
            color: isFocused ? primaryColor : Colors.grey.shade400,
            width: isFocused ? 2 : 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.text,
        cursorColor: primaryColor,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: darkColor,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]')),
        ],
        decoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}