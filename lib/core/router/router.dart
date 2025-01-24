import 'package:dynamics/core/widget_keys/widget_keys.dart';
import 'package:dynamics/features/dynamics/presentation/dynamics_page.dart';
import 'package:dynamics/splash_screen.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

final goRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  navigatorKey: rootNavKey,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: AppRoutes.dynamics,
      builder: (context, state) {
        return const DynamicsPage();
      },
    ),
  ],
);
