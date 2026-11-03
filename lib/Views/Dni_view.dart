import 'package:dienai/Viewmodels/Dni_controller.dart';
import 'package:flutter/material.dart';

class DniView extends StatefulWidget {
  const DniView({super.key});

  @override
  State<DniView> createState() => _DniViewState();
}

class _DniViewState extends State<DniView> {
  final TextEditingController _textController = TextEditingController();
  final DniViewModel _viewModel = DniViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.addListener(() {
      setState(() {}); // Redibuja la vista cuando el ViewModel avise cambios
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta DNI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _textController,
              keyboardType: TextInputType.number,
              maxLength: 8,
              decoration: const InputDecoration(
                labelText: 'Ingrese DNI',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _viewModel.isLoading
                  ? null
                  : () => _viewModel.consultarDni(_textController.text),
              child: _viewModel.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Consultar'),
            ),
            const SizedBox(height: 24),
            if (_viewModel.errorMessage != null)
              Text(
                _viewModel.errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            if (_viewModel.persona != null) ...[
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DNI: ${_viewModel.persona!.dni}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Nombres: ${_viewModel.persona!.nombres}'),
                      Text(
                        'Apellido Paterno: ${_viewModel.persona!.apellidoPaterno}',
                      ),
                      Text(
                        'Apellido Materno: ${_viewModel.persona!.apellidoMaterno}',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
