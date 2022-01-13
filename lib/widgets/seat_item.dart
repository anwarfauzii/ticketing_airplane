import '../cubit/seat_cubit.dart';
import '../shared/theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatItem extends StatelessWidget {
  final bool isAvailable;
  final String id;
  const SeatItem({
    Key? key,
    required this.id,
    this.isAvailable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelect = context.watch<SeatCubit>().isSelected(id);
    containerColor() {
      if (!isAvailable) {
        return unavailableColor;
      } else {
        if (isSelect) {
          return purpleColor;
        } else {
          return availableColor;
        }
      }
    }

    border() {
      if (isAvailable) {
        return purpleColor;
      } else {
        return unavailableColor;
      }
    }

    childText() {
      if (isSelect) {
        return Center(
          child: Text(
            'YOU',
            style: whiteTextStyle.copyWith(fontWeight: semiBold),
          ),
        );
      } else {
        const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: containerColor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: border(), width: 2)),
        child: childText(),
      ),
    );
  }
}
