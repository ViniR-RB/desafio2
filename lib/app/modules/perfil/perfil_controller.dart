import 'dart:developer';

import 'package:desafio/app/core/models/building_model.dart';
import 'package:desafio/app/core/models/perfil_model.dart';
import 'package:desafio/app/core/models/service_model.dart';
import 'package:desafio/app/core/utils/day_week_enum.dart';
import 'package:flutter/material.dart';

class PerfilController extends ValueNotifier<PerfilModel> {
  PerfilController()
      : super(
          PerfilModel(
            perfilName: 'Cidade ADM de MG',
            bio: 'Perfil Oficial da Cidade Administrativa de MG ',
            location: 'Cidade administrativa',
            generalAdministrator: '@paulo.oliveira32',
            moderators: ['@oliverpereiraa', '@21joaobotelho'],
            image: 'assets/images/perfil_elypse.png',
            service: [
              ServiceModel(
                dayOfTheWeek: DayWeekEnum.segunda,
                hours: ['09:00', '17:00'],
              ),
              ServiceModel(
                dayOfTheWeek: DayWeekEnum.terca,
                hours: ['09:00', '17:00'],
              ),
              ServiceModel(
                dayOfTheWeek: DayWeekEnum.quarta,
                hours: ['09:00', '17:00'],
              ),
              ServiceModel(
                dayOfTheWeek: DayWeekEnum.quinta,
                hours: ['09:00', '17:00'],
              ),
              ServiceModel(
                dayOfTheWeek: DayWeekEnum.sexta,
                hours: ['09:00', '17:00'],
              ),
              ServiceModel(
                dayOfTheWeek: DayWeekEnum.sabado,
                hours: [],
              ),
              ServiceModel(dayOfTheWeek: DayWeekEnum.domingo, hours: []),
            ],
            buildings: [
              BuildingModel(
                  buildingName: 'Edifício Sul',
                  buildingPerfil: '@edificiosul',
                  buildingImage: 'assets/images/edificiosul.png',
                  buildingAdministrator: '@felipeluizz_'),
              BuildingModel(
                buildingName: 'Edifício Norte',
                buildingPerfil: '@edificionorte',
                buildingImage: 'assets/images/edificionorte.png',
                buildingAdministrator: '@robertapaula20',
              ),
              BuildingModel(
                buildingName: 'Edifício Centro',
                buildingPerfil: '@edificiocentral',
                buildingImage: 'assets/images/edificiocentro.png',
                buildingAdministrator: '@eumunhozricardo',
              ),
            ],
            locationAddress:
                'São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102',
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
