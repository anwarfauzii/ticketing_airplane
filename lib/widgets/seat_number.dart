import '../shared/theme.dart';

import 'package:flutter/material.dart';

class SeatNumber extends StatelessWidget {
  final int number;
  const SeatNumber({Key? key, required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      height: 48,
      child: Center(
        child: Text(
          number.toString(),
          style: greyTextStyle.copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
