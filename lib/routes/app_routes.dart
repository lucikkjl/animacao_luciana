import 'package:flutter/material.dart';
import '../screens/galeria/galeria_screen.dart';
import '../screens/detalhes/detalhes_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String detalhes = '/detalhes';

  static Map<String, WidgetBuilder> get routes {
    return {
      home: (context) => const GaleriaScreen(),
      detalhes: (context) => const DetalhesScreen(),
    };
  }
}