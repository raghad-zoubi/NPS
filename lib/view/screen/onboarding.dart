
import 'package:nps/controller/onboarding_controller.dart';
import 'package:nps/view/widjet/onboarding/customDot.dart';
import 'package:nps/view/widjet/onboarding/custombutton.dart';
import 'package:nps/view/widjet/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Get.put(OnBoardingControllerImp());
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
           Expanded(
            flex: 3,
            child: CustomSliderOnBoarding()
          ),
          Expanded(
              child: Column(
            children: const [
              CustomDotOnBoarding(),
              Spacer(
                flex: 2,
              ),
              CustomButtonOnBoarding(),
            ],
          )),
        ],
      )),
    );
  }
}
