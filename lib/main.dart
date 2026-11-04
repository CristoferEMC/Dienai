import 'package:flutter/material.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dienai',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // 👈 Usamos builder para aplicar SafeArea de forma global en todas las vistas
      builder: (context, child) {
        return SafeArea(
          top: false, // Mantiene la barra de estado y AppBar limpios arriba
          bottom: true, // Protege la parte inferior (botones/gestos) en toda la app
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: const HomeView(),
    );
  }
}