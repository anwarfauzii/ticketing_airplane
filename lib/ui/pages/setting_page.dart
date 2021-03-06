import '../../cubit/auth_cubit.dart';
import '../../cubit/page_cubit.dart';
import '../../shared/theme.dart';
import '../../widgets/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: redColor,
              content: Text(state.error),
            ),
          );
        }else if(state is AuthInitial){
          context.read<PageCubit>().setPage(0);
          Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if(state is AuthLoading){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return CustomButton(
          tittle: 'Sign Out',
          onPressed: () {
            context.read<AuthCubit>().signOut();
          },
          width: 220,
        );
      },
    ));
  }
}
