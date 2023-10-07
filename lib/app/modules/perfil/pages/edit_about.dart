import 'package:desafio/app/core/models/perfil_model.dart';
import 'package:desafio/app/modules/perfil/perfil_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/colors.dart';
import '../widgets/card_building_edit.dart';
import '../widgets/edit_hour.dart';

class EditAboutPage extends StatelessWidget {
  final PerfilController controller;
  const EditAboutPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final PerfilModel myPerfil = controller.value;
    return Scaffold(
      body: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
                title: const Text(
                  'Editar sobre',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF001B3D),
                  ),
                ),
                actions: const [
                  Text(
                    'Salvar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColor.blue),
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
                leading: switch (Modular.to.canPop()) {
                  true => IconButton(
                      onPressed: () => Modular.to.pop(),
                      icon: const Icon(Icons.arrow_back_ios,
                          color: AppColor.blue),
                    ),
                  false => const SizedBox.shrink(),
                }),
            SliverPadding(
              padding: const EdgeInsets.only(top: 32, left: 24.0, right: 24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const Text(
                      'Horário de Atendimento',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => EditHour(
                  serviceHours: myPerfil.service[index],
                ),
                childCount: myPerfil.service.length,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                  top: 32.0, left: 24.0, right: 24.0, bottom: 24),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Edifícios',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700)),
                        SizedBox(
                          height: 29,
                          width: 97,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Adicionar',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => CardBuildingEdit(
                          building: myPerfil.buildings[index],
                          isLast: index == myPerfil.buildings.length - 1,
                        ),
                    childCount: myPerfil.buildings.length))
          ],
        )
      ]),
    );
  }
}
