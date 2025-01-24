import 'package:dynamics/config/theme/app_colors.dart';
import 'package:dynamics/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    await setupLocator();
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      context.go(AppRoutes.dynamics);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldWhite,
      body: Container(
        margin: const EdgeInsets.all(50),
        padding: const EdgeInsets.only(bottom: 50),
        alignment: Alignment.bottomCenter,
        child: const CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
