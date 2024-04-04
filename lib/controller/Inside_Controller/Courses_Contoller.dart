import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';
import '../../data/model/Profile_Model.dart';


class Courses_Controller extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List<ProfileModel> details = [];
  String ?token;
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    show_info_profile();
    super.onInit();
  }

  void show_info_profile() async {
    details = [];
    statusRequest = StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get((Uri.parse("https://ma5znsyria.com/test/teacher.php?token=$token")))
            .timeout(const Duration(seconds: 10), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );
        if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => ProfileModel.fromJson(data))
              .toList();
          details.addAll(c);
          statusRequest = StatusRequest.success;
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest = StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest = StatusRequest.serverException;
      update();

    }
  }
  Future<void> onRefresh() async {
    show_info_profile();
    update();
  }
}
