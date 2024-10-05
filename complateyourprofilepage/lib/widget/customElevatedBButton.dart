import 'package:flutter/material.dart';
import 'package:lcyp/thema/color.dart';

class CustomElevatedBButton extends StatelessWidget {
  final double height;
  final double width;
  final VoidCallback onTap;
  final String text;
  const CustomElevatedBButton(
      {Key? key,
      required this.height,
      required this.width,
      required this.onTap,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          gradient: const LinearGradient(
              colors: <Color>[AppColor.grand_2, AppColor.grand_1],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
