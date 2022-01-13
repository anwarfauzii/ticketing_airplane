import '../../models/destination_model.dart';
import '../../shared/theme.dart';
import 'choose_seat_page.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/interest_item.dart';
import '../../widgets/photos_item.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination;
  const DetailPage(this.destination, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(destination.imageUrl),
          ),
        ),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              whiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 24,
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icon_emblem.png'),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 256),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination.name,
                            style: whiteTextStyle.copyWith(
                                fontSize: 24, fontWeight: semiBold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            destination.city,
                            style: whiteTextStyle.copyWith(
                                fontSize: 16, fontWeight: light),
                            overflow: TextOverflow.ellipsis,
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
                          destination.rating.toString(),
                          style: whiteTextStyle.copyWith(fontWeight: medium),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    color: whiteColor, borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: blackTextStyle.copyWith(height: 2),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Photos',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        PhotoItem(imageUrl: 'assets/image_photo1.png'),
                        PhotoItem(imageUrl: 'assets/image_photo2.png'),
                        PhotoItem(imageUrl: 'assets/image_photo3.png'),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Interest',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: const [
                        InterestItem(name: 'Kids Park'),
                        InterestItem(name: 'Honor Bridge'),
                      ],
                    ),
                    Row(
                      children: const [
                        InterestItem(name: 'City Museum'),
                        InterestItem(name: 'Central Mall'),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NumberFormat.currency(
                                          locale: 'id',
                                          symbol: 'IDR ',
                                          decimalDigits: 0)
                                      .format(destination.price),
                                  style: blackTextStyle.copyWith(
                                      fontSize: 18, fontWeight: medium),
                                ),
                                Text(
                                  'per orang',
                                  style:
                                      greyTextStyle.copyWith(fontWeight: light),
                                )
                              ],
                            ),
                          ),
                          CustomButton(
                            tittle: 'Book Now',
                            width: 170,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChooseSeat(destination),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          backgroundImage(),
          customShadow(),
          content(),
        ],
      ),
    );
  }
}
