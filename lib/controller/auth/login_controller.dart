import 'dart:convert';

import 'package:nps/core/class/statusrequest.dart';
import 'package:nps/core/constant/routes.dart';
import 'package:nps/core/function/checkinternet.dart';
import 'package:nps/core/function/handlingdatacontroller.dart';
import 'package:nps/core/services/services.dart';
import 'package:nps/data/datasource/remote/auth/login.dart';

//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../core/constant/color.dart';
import '../../data/model/Auth_Model.dart';
import 'dart:convert' as convert;

import '../../main.dart';

class LoginController extends GetxController {
  //late TextEditingController email;
  late TextEditingController password;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  StatusRequest statusRequest = StatusRequest.non;
  bool isShowPassword = true;

  List<AuthModel> auth = [];
  MyServices myServices = Get.find();

  @override
  void onInit() {
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    super.dispose();
  }

  @override
  login() async {
    print(password.text);
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      try {
        if (await checkInternet()) {
          var response = await http.post(
            Uri.parse("$link/api/student/login"),
            body: {"password": password.text},
          );
          print(response);
          Map jsonresponse = convert.jsonDecode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            if (jsonresponse['message'] == " successfully") {
              myServices.sharedPreferences.setString("token", jsonresponse['token'].toString());
              myServices.sharedPreferences.setString("name", jsonresponse['name'].toString());
              myServices.sharedPreferences.setString("id", jsonresponse['id'].toString());
              myServices.sharedPreferences.setString("step", '2');
              Get.offNamed(AppRoutes.Home);
            } else if (jsonresponse['message'] == "Unauthenticated") {
              statusRequest = StatusRequest.failure;
              Get.defaultDialog(
                  title: "تنبيه",
                  titleStyle: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                  middleText: "الكود المدخل خاطئ");
            }
          } else {
            statusRequest = StatusRequest.failure;
            Get.defaultDialog(
                title: "تنبيه",
                titleStyle: const TextStyle(
                    color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                middleText: "الكود المدخل خاطئ");
          }
          update();
        } else {
          statusRequest = StatusRequest.offlinefailure;
        }
      } catch (_) {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "تنبيه",
            titleStyle: const TextStyle(
                color: AppColor.primaryColor, fontWeight: FontWeight.bold),
            middleText: "يرجى المحاولة لاحقا");
      }

      update();
    } else {}
  }
}
