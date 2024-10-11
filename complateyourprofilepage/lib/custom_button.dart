import 'package:compileprojects/colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final String text;
  final double size;
  const CustomButton(
      {Key? key,
      required this.screenHeight,
      required this.screenWidth,
      required this.size,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: LinearGradient(
              colors: <Color>[AppColor.grand_1, AppColor.grand_2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(child: Text(text, style: TextStyle(color: Colors.white, fontFamily: "Poppins", fontSize: size, fontWeight: FontWeight.bold),)),
      ),
    );
  }
}
