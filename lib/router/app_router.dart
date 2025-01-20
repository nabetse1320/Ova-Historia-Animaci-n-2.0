import 'package:go_router/go_router.dart';
import '../vistas/screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/objetivos',
      builder: (context, state) => const ObjetivosScreen(),
    ),
    GoRoute(
      path: '/proposito',
      builder: (context, state) => const IntroduccionScreen(),
    ),
    GoRoute(
      path: '/historia',
      builder: (context, state) => const PrimerosPasosScreen(),
    ),
    GoRoute(
      path: '/diferencia',
      builder: (context, state) => const EdadOroScreen(),
    ),
    GoRoute(
      path: '/principios',
      builder: (context, state) => const PrincipiosScreen(),
    ),
    GoRoute(
      path: '/actividad',
      builder: (context, state) => const ActividadScreen(),
    ),
    GoRoute(
      path: '/creditos',
      builder: (context, state) => CreditosScreen(),
    ),
  ],
);
