import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';
import '../../data/model/Notes_Model.dart';
import '../../main.dart';

class Notes_Controller extends GetxController {
  StatusRequest statusRequest_s = StatusRequest.non;
  StatusRequest statusRequest_a = StatusRequest.non;
  MyServices myServices = Get.find();
  List<NotesModel> details_s = [];
  List<NotesModel> details_a = [];
  String? token;
  var oneORtwo = "0".obs;

  void changeoneORtwo(var val) {
    oneORtwo.value = val.toString();
    update();
  }

  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
    show_info_Notes_s();
 show_info_Notes_a();
    //  else     //if (oneORtwo.value=="1")

    super.onInit();
  }

  Future<void> onRefresh() async {
    show_info_Notes_s();
    show_info_Notes_a();
    update();
  }

  void show_info_Notes_s() async {
    details_s = [];
    statusRequest_s = StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var d = await myServices.sharedPreferences.get("token");
        var response = await http.get(
            (Uri.parse("$link/api/student/show/notes/سلوكية")),
            //   (Uri.parse("$link/api/student/show/notes/s?token=$token")),
            headers: {"Authorization": "Bearer  $token"})
  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => NotesModel.fromJson(data))
              .toList();
          details_s.addAll(c);
          if (details_s.isEmpty){
            statusRequest_s = StatusRequest.noData;
            update();
          }
          else{
            statusRequest_s = StatusRequest.success;
            update();
  }
        }
          else {
          statusRequest_s = StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_s = StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_s = StatusRequest.serverException;
      update();
    }
  }

  void show_info_Notes_a() async {
    details_a = [];
    statusRequest_a = StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
            (Uri.parse("$link/api/student/show/notes/غير سلوكية")),
            //   (Uri.parse("$link/api/student/show/notes/s?token=$token")),
            headers: {"Authorization": "Bearer  $token"})
   .timeout(const Duration(seconds:20), onTimeout: () {
    throw TimeoutException("connection time out try agian")
    ;
    }
    );
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => NotesModel.fromJson(data))
              .toList();
          details_a.addAll(c);
          update();
          print("******************************");
          if ( details_a.isEmpty) {

            statusRequest_a = StatusRequest.noData;
            print("******************************");
            update();
          } else {
            statusRequest_a = StatusRequest.success;
            update();
         }
        } else {
          statusRequest_a = StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_a = StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_a = StatusRequest.serverException;
      update();
    }
  }
}
