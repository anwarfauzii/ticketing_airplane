import '../shared/theme.dart';

import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String name;
  const InterestItem({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/icon_check.png'),
              ),
            ),
          ),
          const SizedBox(width: 6),
          Text(name, style: blackTextStyle),
        ],
      ),
    );
  }
}
