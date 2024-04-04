import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../core/class/statusrequest.dart';
import '../core/constant/color.dart';
import '../core/function/checkinternet.dart';
import '../core/services/services.dart';
import '../data/model/Profile_Model.dart';
import '../main.dart';

class Home_Controller extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List<ProfileModel> details = [];
 String ?token;
 String ?name;
 String report='';
  late TextEditingController  reportController;
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
     name = myServices.sharedPreferences.getString("name")!;
     // reportController.text =' ';
     // report =' ';
     reportController = TextEditingController();
     reportController.text = '';
    super.onInit();
  }

void send_report()async {

    statusRequest= StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        //  var response = await http.get((Uri.parse("$link/api/student/store/report?token=$token")));
        var response = await http.post(Uri.parse("$link/api/student/store/report"),
          headers:
          {"Authorization": "Bearer  $token"
          },
          body: {"text":reportController.text},
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.defaultDialog(
              title: "",
              titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
              middleText: "تم الارسال"
          );
          statusRequest= StatusRequest.success;
        }
        else {
          Get.defaultDialog(
              title: "",
              titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
              middleText: "حدث خطا ما يرجى المحاولة لاحقا"
          ); // statusRequest= StatusRequest.serverfailure;

        }
        update();
      } else {
        Get.defaultDialog(
            title: "",
            titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
            middleText: "حدث خطا ما يرجى المحاولة لاحقا"
        );  statusRequest= StatusRequest.offlinefailure;

      }
      update();
    } catch (_) {
      Get.defaultDialog(
          title: "",
          titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
          middleText: "حدث خطا ما يرجى المحاولة لاحقا"
      );statusRequest= StatusRequest.serverException;

      update();

    }
  }



  Future<void> onRefresh() async {

     update();
  }
}
