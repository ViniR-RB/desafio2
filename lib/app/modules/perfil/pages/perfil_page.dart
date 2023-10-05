import 'package:desafio/app/core/ui/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/card_activity.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const Icon(Icons.arrow_back_ios),
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
                            right: 8.0, bottom: 10.0, top: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text('Editar Perfil'),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            const EdgeInsets.only(left: 24.0, bottom: 12.0),
                        child: Row(
                          children: [
                            const Text(
                              'Cidade ADM de MG',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 22),
                            ),
                            Icon(
                              Icons.verified,
                              color: AppColor.orange,
                            ),
                          ],
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 24.0, bottom: 12.0),
                      child: Text(
                        'Perfil Oficial da Cidade Administrativa de MG',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColor.grey,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Cidade administrativa',
                            style: TextStyle(
                                color: AppColor.grey,
                                fontSize: 12.75,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(width: 16),
                          Icon(
                            Icons.calendar_month_outlined,
                            color: AppColor.grey,
                          ),
                          const SizedBox(width: 8),
                          Text('Entrou em jan/23',
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
                        Text('Atividades',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColor.blue)),
                        Text('Sobre',
                            style: TextStyle(
                                color: AppColor.greyStronger, fontSize: 16)),
                        Text('Avisos e Comunicados',
                            style: TextStyle(
                                color: AppColor.greyStronger, fontSize: 16))
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      height: 4,
                      color: AppColor.blue,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => const CardActivity(),
                    childCount: 4),
              )
            ],
          ),
        ],
      ),
    );
  }
}
