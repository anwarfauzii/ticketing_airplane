import '../../cubit/seat_cubit.dart';
import '../../models/destination_model.dart';
import '../../models/transaction_model.dart';
import '../../shared/theme.dart';
import 'checkout_page.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/seat_item.dart';
import '../../widgets/seat_number.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeat extends StatelessWidget {
  final DestinationModel destination;
  const ChooseSeat(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Text(
          'Select Your\nFavorite Seat',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget seatStatus() {
      return Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon_available.png'))),
          ),
          Text('Available', style: blackTextStyle),
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(left: 10, right: 6),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon_selected.png'))),
          ),
          Text('Selected', style: blackTextStyle),
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(left: 10, right: 6),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/icon_unavailable.png'))),
          ),
          Text('Unavailable', style: blackTextStyle),
        ],
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'A',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'B',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            '',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'C',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            'D',
                            style: greyTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(
                        isAvailable: false,
                        id: 'A1',
                      ),
                      SeatItem(isAvailable: false, id: 'B1'),
                      SeatNumber(number: 1),
                      SeatItem(id: 'C1'),
                      SeatItem(id: 'D1'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A2'),
                      SeatItem(id: 'B2'),
                      SeatNumber(number: 2),
                      SeatItem(id: 'C2'),
                      SeatItem(id: 'D2'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A3'),
                      SeatItem(id: 'B3'),
                      SeatNumber(number: 3),
                      SeatItem(id: 'C3'),
                      SeatItem(id: 'D3'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A4'),
                      SeatItem(id: 'B4'),
                      SeatNumber(number: 4),
                      SeatItem(id: 'C4'),
                      SeatItem(id: 'D4'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      SeatItem(id: 'A5'),
                      SeatItem(id: 'B5'),
                      SeatNumber(number: 5),
                      SeatItem(id: 'C5'),
                      SeatItem(id: 'D5'),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Your seat',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 17),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                            fontSize: 16, fontWeight: semiBold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget processButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            tittle: 'Continue to Checkout',
            onPressed: () {
              int price = state.length * destination.price;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                      destination: destination,
                      amountOfTraveler: state.length,
                      selectedSeats: state.join(', '),
                      insurance: true,
                      refundable: false,
                      vat: 0.45,
                      price: price,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
            margin: const EdgeInsets.only(top: 30, bottom: 46),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title(),
                seatStatus(),
                selectSeat(),
                processButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
