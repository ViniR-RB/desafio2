import 'package:desafio/app/core/utils/routes.dart';
import 'package:flutter/material.dart';

import 'core/ui/theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio',
      theme: AppTheme.theme,
      routes: AppRoutes.routes,
    );
  }
}
