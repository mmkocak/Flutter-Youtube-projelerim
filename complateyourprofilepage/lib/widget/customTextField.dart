import 'package:flutter/material.dart';
import 'package:lcyp/thema/color.dart';

class CustomTextField extends StatelessWidget {
  final String hinText;
  const CustomTextField({Key? key, required this.hinText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(screenWidth * 0.04),
        filled: true,
        fillColor: AppColor.borderColor,
        hintText: hinText,
        hintStyle: TextStyle(
          color: AppColor.gray_2,
          fontSize: screenWidth * 0.03,
          fontFamily: "Poppins",
          fontStyle: FontStyle.normal,
        ),
        prefixIcon:const  Icon(Icons.width_wide_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: const  BorderSide(
            color: AppColor.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: const BorderSide(
            color: AppColor.borderColor,
          ),
        ),
        enabledBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: const BorderSide(
            color: AppColor.borderColor,
          ),
        ),
      ),
    );
  }
}
