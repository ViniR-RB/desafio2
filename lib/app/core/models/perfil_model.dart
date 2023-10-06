import 'package:desafio/app/core/models/building_model.dart';
import 'package:desafio/app/core/models/service_model.dart';

class PerfilModel {
  const PerfilModel({
    required this.image,
    required this.perfilName,
    required this.bio,
    required this.location,
    required this.generalAdministrator,
    required this.moderators,
    required this.service,
    required this.buildings,
    required this.locationAddress,
  });

  final String image;
  final String perfilName;
  final String bio;
  final String location;
  final String generalAdministrator;
  final List<String> moderators;
  final List<ServiceModel> service;
  final List<BuildingModel> buildings;
  final String locationAddress;

  PerfilModel copyWith(
      {String? image,
      String? perfilName,
      String? bio,
      String? location,
      String? generalAdministrator,
      List<String>? moderators,
      List<ServiceModel>? service,
      List<BuildingModel>? buildings,
      final String? locationAddress}) {
    return PerfilModel(
        image: image ?? this.image,
        perfilName: perfilName ?? this.perfilName,
        bio: bio ?? this.bio,
        location: location ?? this.location,
        generalAdministrator: generalAdministrator ?? this.generalAdministrator,
        moderators: moderators ?? this.moderators,
        service: service ?? this.service,
        buildings: buildings ?? this.buildings,
        locationAddress: locationAddress ?? this.locationAddress);
  }

  @override
  String toString() {
    return perfilName;
  }
}
