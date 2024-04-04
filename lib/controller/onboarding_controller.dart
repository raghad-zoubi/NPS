import 'package:nps/core/constant/routes.dart';
import 'package:nps/core/services/services.dart';
import 'package:nps/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onChangePage(int x);
}

class OnBoardingControllerImp extends OnBoardingController {
  int currentPage = 0;
  late PageController pageController;
MyServices myServices =Get.find();
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  next() {
    currentPage++;
    if(currentPage>onBoardingList.length-1)
      {
        Get.offAllNamed(AppRoutes.login);
        myServices.sharedPreferences.setString("step", "1");
      }else{
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }

    //update();
  }

  @override
  onChangePage(int x) {
    currentPage = x;
    update();
  }
}
