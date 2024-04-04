import 'package:nps/controller/onboarding_controller.dart';
import 'package:nps/core/constant/color.dart';
import 'package:nps/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    width: controller.currentPage==index ?20 :6,
                    height: 6,
                    duration: const Duration(milliseconds: 900),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                  ))
        ],
      ),
    );
  }
}
