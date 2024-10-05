import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lcyp/thema/color.dart';
import 'package:lcyp/widget/customContainer.dart';
import 'package:lcyp/widget/customElevatedBButton.dart';
import 'package:lcyp/cubit/date_bloc.dart';
import 'package:lcyp/mixin/date_mixin.dart';
import 'package:lcyp/cubit/gender_bloc.dart';
import 'package:lcyp/widget/customTextField.dart';

class LcypPage extends StatelessWidget with DatePickerMixin {
  const LcypPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    const String imagesName = "assets/images/images1.png";
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04, vertical: screenHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                width: screenWidth * 0.9,
                image: const AssetImage(imagesName),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                "Let's complete your profile",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05),
              ),
              Text(
                "It will help us to know more about you!",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.03,
                  color: AppColor.gray_1,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                  child: Column(
                    children: [
                      BlocBuilder<GenderBloc, String?>(
                        builder: (context, selectedGender) {
                          return Container(
                            width: screenWidth * 0.9,
                            child: DropdownButtonFormField(
                              menuMaxHeight: screenHeight * 0.1,
                              isExpanded: false,
                              dropdownColor: AppColor.borderColor,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.supervised_user_circle_outlined,
                                  color: AppColor.gray_1,
                                ),
                                hintText: "Choose gender",
                                hintStyle: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: screenWidth * 0.03,
                                ),
                                filled: true,
                                fillColor: AppColor.borderColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.borderColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.borderColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColor.borderColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              value: context.watch<GenderBloc>().state,
                              items: ['Erkek', 'Kadın']
                                  .map((String gender) => DropdownMenuItem(
                                        child: Text(
                                          gender,
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: screenWidth * 0.04),
                                        ),
                                        value: gender,
                                      ))
                                  .toList(),
                              onChanged: (String? newvalue) {
                                context
                                    .read<GenderBloc>()
                                    .selectGender(newvalue!);
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => selectDate(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenHeight * 0.015),
                          decoration: BoxDecoration(
                            color: AppColor.borderColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.borderColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.today_outlined),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              BlocBuilder<DateBloc, DateTime>(
                                builder: (context, selectedDate) {
                                  return Expanded(
                                    child: Text(
                                      selectedDate == DateTime(1900)
                                          ? "Date of Birth"
                                          : "${selectedDate.toLocal()}"
                                              .split(' ')[0],
                                      style: TextStyle(
                                          color: AppColor.gray_2,
                                          fontFamily: "Poppins",
                                          fontSize: screenWidth * 0.03),
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
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: CustomTextField(
                              hinText: "Your Weight",
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomContainer(
                              screenWidth: screenWidth,
                              screenHeigh: screenHeight,
                              text: "KG",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: CustomTextField(
                              hinText: "Your Height",
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomContainer(
                              screenWidth: screenWidth,
                              screenHeigh: screenHeight,
                              text: "CM",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               SizedBox(
                            height: screenHeight * 0.03,
                          ),
              CustomElevatedBButton(height: screenHeight * 0.07, width: screenWidth * 0.9, onTap: (){}, text: "Next",),
            ],
          ),
        ),
      ),
    );
  }
}
