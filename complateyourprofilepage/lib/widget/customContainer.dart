import 'package:flutter/material.dart';
import 'package:lcyp/thema/color.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {Key? key,
      required this.screenWidth,
      required this.screenHeigh,
      required this.text})
      : super(key: key);
  final double screenWidth;
  final double screenHeigh;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.1,
      height: screenHeigh * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: <Color>[AppColor.purple_2, AppColor.purple_1],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
       
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.04),
        ),
      ),
    );
  }
}
