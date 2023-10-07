import 'package:desafio/app/core/models/building_model.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/colors.dart';

class CardBuildingEdit extends StatelessWidget {
  final BuildingModel building;
  final bool isLast;
  const CardBuildingEdit(
      {super.key, required this.building, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(building.buildingImage),
              ),
            ],
          ),
          title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Text(
                        building.buildingName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.verified,
                        color: AppColor.purple,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ]),
          subtitle: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Flexible(
                    child: Text(
                      'Administrador',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColor.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 62,
                      child: TextFormField(
                        strutStyle: const StrutStyle(
                            height: 1, forceStrutHeight: true, leading: 0),
                        controller: TextEditingController(
                            text: building.buildingAdministrator),
                      ),
                    ),
                  ),
                ],
              ),
              switch (isLast) {
                true => const SizedBox.shrink(),
                false => const Divider()
              }
            ],
          )),
    );
  }
}
