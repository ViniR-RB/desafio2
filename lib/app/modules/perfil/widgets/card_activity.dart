import 'dart:io';

import 'package:desafio/app/core/ui/colors.dart';
import 'package:flutter/material.dart';

class CardActivity extends StatelessWidget {
  final String perfilName;
  final String image;
  const CardActivity(
      {super.key, required this.perfilName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                switch (image.contains('assets')) {
                  true => CircleAvatar(backgroundImage: AssetImage(image)),
                  false => CircleAvatar(
                      backgroundImage: FileImage(File(image)),
                    )
                },
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    perfilName,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.verified,
                  color: AppColor.orange,
                ),
                const SizedBox(
                  width: 9,
                ),
                const Text(
                  '@cidadeadm 12 dias',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.grey),
                )
              ],
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(left: 58.0),
              child: Text(
                'Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF2F2F2F)),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: AppColor.grey,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('0')
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          )
        ],
      ),
    );
  }
}
