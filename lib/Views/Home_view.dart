import 'package:dienai/Viewmodels/Dni_controller.dart';
import 'package:dienai/views/widgets/custom_app_bar.dart';
import 'package:dienai/views/widgets/dni_input_card.dart';
import 'package:dienai/views/widgets/dni_result_card.dart';
import 'package:dienai/views/widgets/legal_notice_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController _dniController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _apellidoPaternoController = TextEditingController();
  final TextEditingController _apellidoMaternoController = TextEditingController();

  final DniViewModel _dniViewModel = DniViewModel();
  final FocusNode _dniFocusNode = FocusNode();

  bool _isComplete = false;
  bool _isFixedDni = false;
  Map<String, dynamic>? _fixedPersonaData;
  bool _isDniSearchActive = true; // Controla qué modo está activo

  @override
  void initState() {
    super.initState();
    _dniViewModel.addListener(() {
      setState(() {});
    });

    _dniFocusNode.addListener(() {
      setState(() {});
    });

    _dniController.addListener(_validarCampos);
    _nombreController.addListener(_validarCampos);
    _apellidoPaternoController.addListener(_validarCampos);
    _apellidoMaternoController.addListener(_validarCampos);
  }

  void _validarCampos() {
    final dniText = _dniController.text.trim();
    final nombreText = _nombreController.text.trim();
    final apPaternoText = _apellidoPaternoController.text.trim();

    bool completeCondition = false;
    if (_isDniSearchActive) {
      completeCondition = (dniText.length == 8);
    } else {
      completeCondition = (nombreText.isNotEmpty && apPaternoText.isNotEmpty);
    }

    if (completeCondition && !_isComplete) {
      setState(() {
        _isComplete = true;
      });
    } else if (!completeCondition && _isComplete) {
      setState(() {
        _isComplete = false;
      });
    }
  }

  // Limpia campos y errores al cambiar de pestaña
  void _onTabChanged(bool isDniMode) {
    setState(() {
      _isDniSearchActive = isDniMode;
      _dniController.clear();
      _nombreController.clear();
      _apellidoPaternoController.clear();
      _apellidoMaternoController.clear();
      _dniViewModel.errorMessage = null;
      _dniViewModel.persona = null;
      _isFixedDni = false;
      _fixedPersonaData = null;
      _isComplete = false;
    });
  }

  @override
  void dispose() {
    _dniController.dispose();
    _nombreController.dispose();
    _apellidoPaternoController.dispose();
    _apellidoMaternoController.dispose();
    _dniViewModel.dispose();
    _dniFocusNode.dispose();
    super.dispose();
  }

  void _consultar() {
    setState(() {
      _isFixedDni = false;
      _fixedPersonaData = null;
      _dniViewModel.errorMessage = null;
    });

    if (_isDniSearchActive) {
      final dni = _dniController.text.trim();
      if (dni == '12345678') {
        setState(() {
          _isFixedDni = true;
          _fixedPersonaData = {
            'dni': '12345678',
            'nombreCompleto': 'Juan Carlos Perez Gomez',
            'edad': '32 años',
            'digitoVerificacion': '5',
          };
        });
      } else {
        _dniViewModel.consultarDni(dni);
      }
    } else {
      final nombres = _nombreController.text.trim();
      final apPaterno = _apellidoPaternoController.text.trim();
      final apMaterno = _apellidoMaternoController.text.trim();

      // Simulación de prueba para cuando escribas Juan Carlos Perez Gomez
      if (nombres.toLowerCase().contains('juan') && apPaterno.toLowerCase().contains('perez')) {
        setState(() {
          _isFixedDni = true;
          _fixedPersonaData = {
            'dni': '87654321',
            'nombreCompleto': '$nombres $apPaterno $apMaterno',
            'edad': '30 años',
            'digitoVerificacion': '3',
          };
        });
      } else {
        _dniViewModel.consultarPorNombre(nombres, apPaterno, apMaterno);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color darkBlue = Color(0xFF0F172A);
    const Color surfaceColor = Color(0xFFF8F9FA);

    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Buscar Persona',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: darkBlue,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Busca un nombre o DNI en Perú de manera rápida y segura.',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            const SizedBox(height: 24),

            DniInputCard(
              dniController: _dniController,
              nombreController: _nombreController,
              apellidoPaternoController: _apellidoPaternoController,
              apellidoMaternoController: _apellidoMaternoController,
              dniFocusNode: _dniFocusNode,
              isComplete: _isComplete,
              isLoading: _dniViewModel.isLoading,
              onConsultar: _consultar,
              onTabChanged: _onTabChanged,
            ),

            DniResultCard(
              errorMessage: _dniViewModel.errorMessage,
              isFixedDni: _isFixedDni,
              fixedPersonaData: _fixedPersonaData,
              persona: _dniViewModel.persona,
            ),
            const SizedBox(height: 24),

            const LegalNoticeCard(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}