import 'package:desafio/app/modules/perfil/pages/perfil_page.dart';
import 'package:flutter/material.dart';

sealed class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const PerfilPage()
  };
}
