import 'package:nps/controller/onboarding_controller.dart';
import 'package:nps/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          //  color: AppColor.primaryColor,
          //  borderRadius: BorderRadius.circular(500),
          // border:  Border.all(color:Colors.black )
          ),
      margin: const EdgeInsets.only(bottom: 30),
      height: 40,
      child: MaterialButton(
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(14) ) ,
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: AppColor.primaryColor,
        child:  Text(
          "تعلسمسه",
        ),
      ),
    );
  }
}
