import 'package:desafio/app/core/models/building_model.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/colors.dart';

class CardBuilding extends StatelessWidget {
  final BuildingModel building;
  const CardBuilding({super.key, required this.building});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(building.buildingImage),
        ),
        title: Row(mainAxisSize: MainAxisSize.max, children: [
          Text(
            building.buildingName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.verified,
            color: AppColor.purple,
          ),
          const SizedBox(width: 8),
          Text(
            building.buildingPerfil,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: AppColor.grey),
          )
        ]),
        subtitle: const Text(
          'Edifício da Cidade Administrativa de MG',
          style: TextStyle(
              fontSize: 16, color: AppColor.black, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
