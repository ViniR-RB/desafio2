import 'package:desafio/app/core/models/service_model.dart';
import 'package:desafio/app/core/utils/day_week_enum.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/colors.dart';

class EditHour extends StatefulWidget {
  final ServiceModel serviceHours;

  const EditHour({super.key, required this.serviceHours});

  @override
  State<EditHour> createState() => _EditHourState();
}

class _EditHourState extends State<EditHour> {
  late final ServiceModel serviceHours;
  late final TextEditingController serviceEC;
  @override
  void initState() {
    serviceHours = widget.serviceHours;
    serviceEC = TextEditingController(
      text: switch (serviceHours.dayOfTheWeek) {
        DayWeekEnum.segunda => 'Segunda-Feira',
        DayWeekEnum.terca => 'Terça-Feira',
        DayWeekEnum.quarta => 'Quarta-Feira',
        DayWeekEnum.quinta => 'Quinta-Feira',
        DayWeekEnum.sexta => 'Sexta-Feira',
        DayWeekEnum.sabado => 'Sábado',
        DayWeekEnum.domingo => 'Domingo',
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 12.0, bottom: 12.0, left: 24.0, right: 24.0),
        child: switch (widget.serviceHours.hours.isEmpty) {
          true => Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: 58,
                    child: TextFormField(
                      controller: serviceEC,
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      minLines: 1,
                      readOnly: true,
                      strutStyle: const StrutStyle(
                          height: 1, forceStrutHeight: true, leading: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    height: 58,
                    child: DropdownButtonFormField(
                      value: 'Fechado',
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.blue,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Fechado',
                          child: Text('Fechado'),
                        ),
                        DropdownMenuItem(
                          value: 'Item 2',
                          child: Text('Item 2'),
                        ),
                        DropdownMenuItem(
                          value: 'Item 3',
                          child: Text('Item 3'),
                        ),
                      ],
                      onChanged: (value) {
                        // Handle the change event
                      },
                    ),
                  ),
                ),
              ],
            ),
          false => Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: SizedBox(
                    child: TextFormField(
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      maxLines: 1,
                      strutStyle: const StrutStyle(
                          height: 1, forceStrutHeight: true, leading: 0),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 58,
                    child: DropdownButtonFormField(
                      value: '09:00',
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.blue,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: '09:00',
                          child: Text('09:00'),
                        ),
                        DropdownMenuItem(
                          value: '17:00',
                          child: Text('17:00'),
                        ),
                      ],
                      onChanged: (value) {
                        // Handle the change event
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'ás',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 58,
                    child: DropdownButtonFormField(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.blue,
                      ),
                      value: '17:00',
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: '09:00',
                          child: Text('09:00'),
                        ),
                        DropdownMenuItem(
                          value: '17:00',
                          child: Text('17:00'),
                        ),
                      ],
                      onChanged: (value) {
                        // Handle the change event
                      },
                    ),
                  ),
                ),
              ],
            ),
        });
  }
}
