import 'package:compileprojects/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
    final double screenWidth;
   final  String hinText;
  const CustomTextfield({Key? key, required this.hinText, required this.screenWidth }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.access_time_outlined, color: AppColor.gray_1,) ,
        hintText: hinText,
        hintStyle: TextStyle(fontFamily: "Poppins", color: AppColor.gray_1, fontSize: screenWidth * 0.035),
        filled: true,
        fillColor: AppColor.borderColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: AppColor.borderColor),
        ),
      ),
      
    );
  }
}
