import 'dart:developer';

import 'package:desafio/app/core/models/perfil_model.dart';
import 'package:flutter/material.dart';

class PerfilController extends ValueNotifier<PerfilModel> {
  PerfilController()
      : super(
          const PerfilModel(
            perfilName: 'Cidade ADM de MG',
            bio: 'Perfil Oficial da Cidade Administrativa de MG ',
            location: 'Cidade administrativa',
            generalAdministrator: '@paulo.oliveira32',
            moderators: ['@oliverpereiraa', '@21joaobotelho'],
            image: 'assets/images/perfil_elypse.png',
          ),
        );

  void changePerfil(
    String? image,
    String? perfilName,
    String? bio,
    String? location,
    String? generalAdministrator,
    List<String>? moderators,
  ) {
    final newPerfil = value.copyWith(
        image: image,
        perfilName: perfilName,
        bio: bio,
        location: location,
        generalAdministrator: generalAdministrator,
        moderators: moderators);

    value = newPerfil;

    log('$value');
  }
}
