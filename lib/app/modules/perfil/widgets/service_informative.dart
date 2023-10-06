import 'package:desafio/app/core/models/service_model.dart';
import 'package:desafio/app/core/ui/colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/day_week_enum.dart';

class ServiceInformative extends StatelessWidget {
  final ServiceModel service;
  final TextStyle _textStyle = const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 14, color: AppColor.grey);

  const ServiceInformative({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        switch (service.dayOfTheWeek) {
          DayWeekEnum.domingo => Text('Domingo', style: _textStyle),
          DayWeekEnum.segunda => Text('Segunda-Feira', style: _textStyle),
          DayWeekEnum.terca => Text('Terça-Feira', style: _textStyle),
          DayWeekEnum.quarta => Text('Quarta-Feira', style: _textStyle),
          DayWeekEnum.quinta => Text('Quinta-Feira', style: _textStyle),
          DayWeekEnum.sexta => Text('Sexta-Feira', style: _textStyle),
          DayWeekEnum.sabado => Text('Sábado', style: _textStyle),
        },
        const Flexible(
          child: Divider(
            color: AppColor.greyStronger,
            height: 10,
            endIndent: 8,
            indent: 8,
          ),
        ),
        switch (service.hours.isEmpty) {
          true => Text(
              'Fechado',
              style: _textStyle,
            ),
          false => Text.rich(
              style: _textStyle,
              TextSpan(text: service.hours[0], children: [
                TextSpan(text: ' às ${service.hours[1]}'),
              ]))
        }
      ],
    );
  }
}
