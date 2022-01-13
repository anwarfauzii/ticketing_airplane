import '../shared/theme.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String tittle;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin; 
  const CustomButton({Key? key, required this.tittle, this.width = double.infinity, this.margin = EdgeInsets.zero, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: purpleColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(tittle,
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium)),
      ),
    );
  }
}
