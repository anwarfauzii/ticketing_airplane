import '../../cubit/auth_cubit.dart';
import '../../cubit/transaction_cubit.dart';
import '../../models/transaction_model.dart';
import '../../shared/theme.dart';
import '../../widgets/booking_details_item.dart';
import '../../widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          children: [
            Container(
              width: 291,
              height: 65,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image_checkout.png'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      'Ciliwung',
                      style: greyTextStyle.copyWith(fontWeight: light),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetail() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(transaction.destination.imageUrl),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.destination.name,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        transaction.destination.city,
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/icon_star.png'),
                        ),
                      ),
                    ),
                    Text(
                      transaction.destination.rating.toString(),
                      style: blackTextStyle.copyWith(fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                'Booking Details',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
              ),
            ),
            BookingDetailsItem(
                title: 'Traveler',
                valueText: '${transaction.amountOfTraveler} person',
                valueColor: blackColor),
            BookingDetailsItem(
                title: 'Seat',
                valueText: transaction.selectedSeats,
                valueColor: blackColor),
            BookingDetailsItem(
                title: 'Insurance',
                valueText: transaction.insurance ? 'YES' : 'NO',
                valueColor: transaction.insurance ? greenColor : redColor),
            BookingDetailsItem(
                title: 'Refundable',
                valueText: transaction.refundable ? 'YES' : 'NO',
                valueColor: transaction.refundable ? greenColor : redColor),
            BookingDetailsItem(
                title: 'Vat',
                valueText: '${(transaction.vat * 100).toStringAsFixed(0)}%',
                valueColor: blackColor),
            BookingDetailsItem(
                title: 'Price',
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.price),
                valueColor: blackColor),
            BookingDetailsItem(
                title: 'Grand Total',
                valueText: NumberFormat.currency(
                        locale: 'id', symbol: 'IDR ', decimalDigits: 0)
                    .format(transaction.grandTotal),
                valueColor: purpleColor),
          ],
        ),
      );
    }

    Widget paymentDetail() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Details',
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16, right: 16),
                        width: 100,
                        height: 70,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/image_card.png',
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(right: 6),
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage('assets/icon_plane.png'),
                                ),
                              ),
                            ),
                            Text(
                              'Pay',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: 'id',
                                    symbol: 'IDR ',
                                    decimalDigits: 0)
                                .format(state.user.balance),
                            style: blackTextStyle.copyWith(
                                fontSize: 18, fontWeight: medium),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Current Balance',
                            style: greyTextStyle.copyWith(fontWeight: light),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget buttonProcess() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {

          if (state is TransactionSuccess){
            Navigator.pushNamedAndRemoveUntil(context, '/success', (route) => false);
          }else if (state is TransactionFailed){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),),);
          }
        },
        builder: (context, state) {
          if(state is TransactionLoading){
            return Container(
              margin: const EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          return CustomButton(
            tittle: 'Pay Now',
            onPressed: () => context.read<TransactionCubit>().createTransaction(transaction),
            margin: const EdgeInsets.only(top: 30),
          );
        },
      );
    }

    Widget term() {
      return Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30),
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            header(),
            bookingDetail(),
            paymentDetail(),
            buttonProcess(),
            term(),
          ],
        ));
  }
}
