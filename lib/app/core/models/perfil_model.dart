class PerfilModel {
  const PerfilModel({
    required this.image,
    required this.perfilName,
    required this.bio,
    required this.location,
    required this.generalAdministrator,
    required this.moderators,
  });

  final String image;
  final String perfilName;
  final String bio;
  final String location;
  final String generalAdministrator;
  final List<String> moderators;

  PerfilModel copyWith({
    String? image,
    String? perfilName,
    String? bio,
    String? location,
    String? generalAdministrator,
    List<String>? moderators,
  }) {
    return PerfilModel(
      image: image ?? this.image,
      perfilName: perfilName ?? this.perfilName,
      bio: bio ?? this.bio,
      location: location ?? this.location,
      generalAdministrator: generalAdministrator ?? this.generalAdministrator,
      moderators: moderators ?? this.moderators,
    );
  }

  @override
  String toString() {
    return perfilName;
  }
}
