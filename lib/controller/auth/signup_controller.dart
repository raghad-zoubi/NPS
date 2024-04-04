import 'package:nps/core/class/statusrequest.dart';
import 'package:nps/core/constant/routes.dart';
import 'package:nps/core/function/handlingdatacontroller.dart';
import 'package:nps/core/services/services.dart';
import 'package:nps/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signUp();

  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController name;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  SignupData signupData = SignupData(Get.find());
  List data = [];
  StatusRequest statusRequest=StatusRequest.non;

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    name = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
        name: name.text,
        email: email.text,
        password: password.text,
        phone: phone.text,
      );
      print("=============================== Controller signup=> $response ");
      statusRequest = handlingData(response);
      print("$statusRequest");
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.verfiyCodeSignUp,
              arguments: {"email": email.text}); //should be email
        } else {
          statusRequest = StatusRequest.failure;
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone number or email is already exists");
        }
      }
      update();

      //Get.delete<SignUpControllerImp>();

    } else {
      print("Not Valid");
    }
  }
}
