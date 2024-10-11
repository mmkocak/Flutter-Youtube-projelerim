import 'package:compileprojects/colors.dart';
import 'package:compileprojects/custom_button.dart';
import 'package:compileprojects/custom_container.dart';
import 'package:compileprojects/custom_textfield.dart';
import 'package:compileprojects/date_cubit.dart';
import 'package:compileprojects/date_mixin.dart';
import 'package:compileprojects/gender_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget with DateTimePicker {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    const String image = "assets/images/images1.png";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.03, horizontal: screenWidth * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(image),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                "Let's  complate your profile",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                "it will help us to know more about you!",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.03,
                    color: AppColor.gray_1),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Form(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: BlocBuilder<GenderCubit, String?>(
                        builder: (context, state) {
                          return Container(
                            width: screenWidth * 0.9,
                            child: DropdownButtonFormField(
                              dropdownColor: AppColor.borderColor,
                              decoration: InputDecoration(
                                fillColor: AppColor.borderColor,
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.supervised_user_circle_outlined,
                                  color: AppColor.gray_1,
                                ),
                                hintText: "Choose Gender",
                                hintStyle: TextStyle(
                                    fontFamily: "Poppins",
                                    color: AppColor.gray_1),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: AppColor.borderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: AppColor.borderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: AppColor.borderColor),
                                ),
                              ),
                              value: context.watch<GenderCubit>().state,
                              items: ['Kadın', 'Erkek']
                                  .map((String gender) => DropdownMenuItem(
                                        child: Text(
                                          gender,
                                          style:
                                              TextStyle(fontFamily: "Poppins"),
                                        ),
                                        value: gender,
                                      ))
                                  .toList(),
                              onChanged: (String? newvalue) {
                                context
                                    .read<GenderCubit>()
                                    .selectGender(newvalue);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    GestureDetector(
                      onTap: () => selectDate(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight * 0.015),
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.borderColor,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            Icon(
                              Icons.today_outlined,
                              color: AppColor.gray_1,
                            ),
                            SizedBox(
                              width: screenWidth * 0.03,
                            ),
                            BlocBuilder<DateCubit, DateTime?>(
                              builder: (context, selectedDate) {
                                return Expanded(
                                  child: Text(
                                    selectedDate == null
                                        ? "Date of brith"
                                        : "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                    style: TextStyle(fontFamily: "Popins"),
                                  ),
                                );
                              },    
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: CustomTextfield(
                                hinText: "Your Weight",
                                screenWidth: screenWidth,
                              )),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                              flex: 2,
                              child: CustomContainer(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                text: "KG",
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: CustomTextfield(
                                hinText: "Your Height",
                                screenWidth: screenWidth,
                              )),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                              flex: 2,
                              child: CustomContainer(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                text: "CM",
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight * 0.03,
                    ),
                    CustomButton( screenHeight: screenHeight * 0.07, screenWidth: screenWidth *0.9, size: screenWidth * 0.06, text: "Next",),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
