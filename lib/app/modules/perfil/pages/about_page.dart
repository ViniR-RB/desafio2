import 'package:desafio/app/modules/perfil/perfil_controller.dart';
import 'package:desafio/app/modules/perfil/widgets/card_building.dart';
import 'package:desafio/app/modules/perfil/widgets/service_informative.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/models/perfil_model.dart';
import '../../../core/ui/colors.dart';

class AboutPage extends StatefulWidget {
  final PerfilController controller;
  const AboutPage({super.key, required this.controller});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: widget.controller,
        builder: (context, value, child) {
          final PerfilModel myPerfil = value;
          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: switch (Modular.to.canPop()) {
                      true => IconButton(
                          onPressed: () => Modular.to.pop(),
                          icon: const Icon(Icons.arrow_back_ios,
                              color: AppColor.blue),
                        ),
                      false => const SizedBox.shrink(),
                    },
                    expandedHeight: 212,
                    flexibleSpace: Container(
                      width: size.width,
                      decoration: const BoxDecoration(color: Colors.red),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 24.0, bottom: 12.0, top: 72),
                            child: Row(
                              children: [
                                Text(
                                  myPerfil.perfilName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                                const Icon(
                                  Icons.verified,
                                  color: AppColor.orange,
                                ),
                              ],
                            )),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 24.0, bottom: 12.0),
                          child: Text(
                            myPerfil.bio,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_on_outlined,
                                color: AppColor.grey,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                myPerfil.location,
                                style: const TextStyle(
                                    color: AppColor.grey,
                                    fontSize: 12.75,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(width: 16),
                              const Icon(
                                Icons.calendar_month_outlined,
                                color: AppColor.grey,
                              ),
                              const SizedBox(width: 8),
                              const Text('Entrou em jan/23',
                                  style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize: 12.75,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Modular.to.navigate('/');
                              },
                              child: const Text('Atividades',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColor.greyStronger)),
                            ),
                            GestureDetector(
                              onTap: () {
                                Modular.to.navigate('/about');
                              },
                              child: const Text('Sobre',
                                  style: TextStyle(
                                      color: AppColor.blue, fontSize: 16)),
                            ),
                            GestureDetector(
                              child: const Text('Avisos e Comunicados',
                                  style: TextStyle(
                                      color: AppColor.greyStronger,
                                      fontSize: 16)),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          height: 4,
                          color: AppColor.blue,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () =>
                                      Modular.to.pushNamed('/edit-about'),
                                  child: const Text('Editar seção sobre')),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 24.0, top: 32),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Horário de Atendimento',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24)
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.only(
                            left: 24.0, right: 24.0, bottom: 12.0),
                        child: ServiceInformative(
                            service: myPerfil.service[index]),
                      ),
                      childCount: myPerfil.service.length,
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 24, top: 32),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const Text(
                            'Edifícios',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => CardBuilding(
                              building: myPerfil.buildings[index],
                            ),
                        childCount: myPerfil.buildings.length),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 24, top: 32),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const Text(
                            'Localização',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 24),
                          const Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColor.purple,
                              ),
                              SizedBox(width: 8),
                              Text(
                                  'São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102',
                                  style: TextStyle(
                                      fontSize: 14,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                      color: AppColor.grey))
                            ],
                          ),
                          const SizedBox(height: 24),
                          Container(
                            height: 142,
                            margin: const EdgeInsets.only(right: 24),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/images/location.png',
                                    ))),
                          )
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 24, top: 32),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          const Text(
                            'Contato',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              Icon(
                                Icons.message_outlined,
                                color: AppColor.purple,
                              ),
                              SizedBox(width: 8),
                              Text(
                                '+55 15 91234-5678',
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: AppColor.purple,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'edificiosul@governomg.com.br',
                                style: TextStyle(
                                    fontSize: 14,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
