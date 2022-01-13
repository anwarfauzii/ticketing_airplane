import 'cubit/auth_cubit.dart';
import 'cubit/destination_cubit.dart';
import 'cubit/seat_cubit.dart';
import 'cubit/transaction_cubit.dart';
import 'ui/pages/signin_page.dart';
import 'ui/pages/bonus_page.dart';
import 'ui/pages/get_started_page.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/signup_page.dart';
import 'ui/pages/splash_page.dart';
import 'ui/pages/success_checkout_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => DestinationCubit(),
        ),
        BlocProvider(
          create: (context) => SeatCubit(),
        ),
        BlocProvider(
          create: (context) => TransactionCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          '/': (context) => const SplashPage(),
          '/get-started': (context) => const GetStartedPage(),
          '/sign-up': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/bonus': (context) => const BonusPage(),
          '/main': (context) => const MainPage(),
          '/success': (context) => const SuccessCheckoutPage(),
        },
      ),
    );
  }
}
