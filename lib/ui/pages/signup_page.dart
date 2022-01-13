import '../../cubit/auth_cubit.dart';
import '../../shared/theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController hobbyController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Join us and get\nyour next journey',
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
        ),
      );
    }

    Widget inputSection() {
      return Container(
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            CustomTextFormField(
              tittle: 'Full Name',
              hintText: 'Your Fullname',
              controller: nameController,
            ),
            CustomTextFormField(
                tittle: 'Email Address',
                hintText: 'Your Email Address',
                controller: emailController),
            CustomTextFormField(
              tittle: 'Password',
              hintText: 'Your Password',
              controller: passwordController,
              obsecureText: true,
            ),
            CustomTextFormField(
              tittle: 'Hobby',
              hintText: 'Your Hobby',
              controller: hobbyController,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthSuccess) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/bonus', (route) => false);
                } else if (state is AuthFailed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: redColor,
                      content: Text(state.error),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  tittle: 'Get Started',
                  onPressed: () {
                    context.read<AuthCubit>().signUp(
                        email: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        hobby: hobbyController.text);
                  },
                  margin: const EdgeInsets.only(top: 30),
                );
              },
            ),
          ],
        ),
      );
    }

    Widget term() {
      return GestureDetector(
        onTap: ()=>Navigator.pushNamed(context, '/sign-in'),
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50, bottom: 73),
            child: Text(
              'Already have an account ? Sign In',
              style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
            term(),
          ],
        ),
      ),
    );
  }
}
