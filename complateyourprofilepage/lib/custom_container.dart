import 'package:compileprojects/colors.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String text;
  const CustomContainer(
      {Key? key, required this.screenHeight, required this.screenWidth, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.04,
      height: screenHeight * 0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: LinearGradient(
            colors: <Color>[AppColor.purple_1, AppColor.purple_2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: screenWidth * 0.05,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
