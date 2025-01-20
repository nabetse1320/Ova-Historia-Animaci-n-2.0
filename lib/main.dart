import 'package:parcial_final_app/router/app_router.dart';
import 'package:parcial_final_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ParcialApp());
}

class ParcialApp extends StatelessWidget {
  const ParcialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Componentes de Flutter',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0).getTheme(),
    );
  }
}
