import '../shared/theme.dart';

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String tittle;
  final bool obsecureText;
  final String hintText;
  final TextEditingController controller;
  const CustomTextFormField({Key? key,required this.tittle, required this.hintText, required this.controller, this.obsecureText=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tittle,
            style: blackTextStyle.copyWith(fontSize: 14, fontWeight: regular),
          ),
          const SizedBox(height: 6),
          TextFormField(
            cursorColor: blackColor,
            obscureText: obsecureText,
            controller : controller,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: purpleColor))),
          )
        ],
      ),
    );
  }
}
