import '../../cubit/page_cubit.dart';
import '../../shared/theme.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';
import 'home_page.dart';
import 'setting_page.dart';
import 'transaction_page.dart';
import 'wallet_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
               CustomBottomNavigationBar(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              CustomBottomNavigationBar(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
              ),
              CustomBottomNavigationBar(
                index: 2,
                imageUrl: 'assets/icon_credit.png',
              ),
              CustomBottomNavigationBar(
                index: 3,
                imageUrl: 'assets/icon_setting.png',
              )
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
