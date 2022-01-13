import '../../cubit/auth_cubit.dart';
import '../../cubit/destination_cubit.dart';
import '../../models/destination_model.dart';
import '../../shared/theme.dart';
import '../../widgets/custom_destination_card.dart';
import '../../widgets/destination_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(left: 24, right: 24, top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Howdy,\n${state.user.name}',
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Where to fly today?',
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/image_profile.png'),
                      ),
                      shape: BoxShape.circle,
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget destinationcard(List<DestinationModel> destination) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: destination.map((DestinationModel destination) {
            return DestinationCard(destination);
          }).toList(),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destination) {
      return Container(
        margin: EdgeInsets.only(
            top: 30, bottom: 100, left: defaultMargin, right: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New This Year',
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Column(
              children: destination.map((DestinationModel destination) {
                return DestinationTile(destination);
              }).toList(),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: BlocConsumer<DestinationCubit, DestinationState>(
        listener: (context, state) {
          if (state is DestinationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.error),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is DestinationSuccess) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                header(),
                destinationcard(state.destination),
                newDestination(state.destination),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
