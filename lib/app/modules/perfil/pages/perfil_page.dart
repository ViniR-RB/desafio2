import 'dart:io';

import 'package:desafio/app/core/models/perfil_model.dart';
import 'package:desafio/app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../perfil_controller.dart';
import '../widgets/card_activity.dart';

class PerfilPage extends StatefulWidget {
  final PerfilController controller;
  const PerfilPage({super.key, required this.controller});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  void initState() {
    super.initState();
  }

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
                  expandedHeight: 212,
                  flexibleSpace: Stack(
                    children: [
                      Container(
                        width: size.width,
                        alignment: Alignment.bottomLeft,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/cidade.jpeg')),
                        ),
                      ),
                      Positioned(
                          left: 22, // Ajuste o valor conforme necessário
                          bottom: 0, // Ajuste o valor conforme necessário
                          child: myPerfil.image.contains('assets')
                              ? Image.asset('assets/images/perfil.png')
                              : Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 6, color: Colors.white),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              FileImage(File(myPerfil.image)))),
                                )),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 8.0, bottom: 10.0, top: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => Modular.to.pushNamed('/edit'),
                                child: const Text('Editar Perfil'),
                              ),
                            ],
                          )),
                      Padding(
                          padding:
                              const EdgeInsets.only(left: 24.0, bottom: 12.0),
                          child: Row(
                            children: [
                              Text(
                                myPerfil.perfilName,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 22),
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
                                    color: AppColor.blue)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Modular.to.navigate('/about');
                            },
                            child: const Text('Sobre',
                                style: TextStyle(
                                    color: AppColor.greyStronger,
                                    fontSize: 16)),
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
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => CardActivity(
                          image: myPerfil.image,
                          perfilName: myPerfil.perfilName),
                      childCount: 4),
                ),
              ],
            ),
          ],
        );
      },
    ));
  }
}
