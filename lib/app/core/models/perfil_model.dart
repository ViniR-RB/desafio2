import 'package:flutter/material.dart';

class PerfilModel {
  const PerfilModel({
    required this.perfilName,
    required this.bio,
    required this.location,
    required this.generalAdministrator,
    required this.moderators,
    required this.image,
  });

  final Image image;
  final String perfilName;
  final String bio;
  final String location;
  final String generalAdministrator;
  final List<String> moderators;
}
