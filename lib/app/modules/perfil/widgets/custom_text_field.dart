import 'package:desafio/app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF262626),
                    letterSpacing: 1.5)),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller,
              strutStyle: const StrutStyle(
                  height: 1, forceStrutHeight: true, leading: 0),
              validator: Validatorless.required('Esse Campo é requrido'),
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  overflow: TextOverflow.clip,
                  color: AppColor.black),
            ),
          ],
        ));
  }
}
