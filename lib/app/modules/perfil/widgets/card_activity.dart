import 'package:desafio/app/core/ui/colors.dart';
import 'package:flutter/material.dart';

class CardActivity extends StatelessWidget {
  const CardActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/perfil_elypse.png'),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    'Cidade ADM de MG',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColor.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.verified,
                  color: AppColor.orange,
                ),
                const SizedBox(
                  width: 9,
                ),
                Text(
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
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: AppColor.grey,
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text('0')
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
