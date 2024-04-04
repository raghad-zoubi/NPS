import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';
import '../../data/model/Profile_Model.dart';
import '../../main.dart';
import '../mod_folder/In_Permanence_Model.dart';
import '../mod_folder/Permanence_Model.dart';



// permission
// lateness
// absence
//permanence
class absence_Controller extends GetxController {
  StatusRequest statusRequest_absence = StatusRequest.non;
  StatusRequest  statusRequest_absence_Unexcused= StatusRequest.non;
  StatusRequest statusRequest_absence_Excused= StatusRequest.non;
  MyServices myServices = Get.find();
  List<PermanenceModel>   details_absence= [];
  List<InPermanenceModel>   details_absence_Unexcused = [];
  List<InPermanenceModel>   details_absence_Excused= [];
  String ?token;

  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
show_info_absence();
    // show_info_absence_Excused();
    // show_info_absence_Unexcused();

    super.onInit();
  }

  void     show_info_absence() async {
    details_absence = [];
    statusRequest_absence = StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
          // (Uri.parse("pop")));
         //  (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/absence?token=$token")));

            (Uri.parse("$link/api/student/index/absence")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );
        if (response.statusCode == 200 || response.statusCode == 201) {
          print("in abs info________________");
          print(response.body);
          print(response);
          print(response.statusCode);
          Map<String, dynamic>  jsonResponse = jsonDecode(response.body);
          var c =
              PermanenceModel.fromJson(jsonResponse);

       details_absence.add(c);
          print(details_absence.length);
          statusRequest_absence = StatusRequest.success;
        } else {
          statusRequest_absence = StatusRequest.serverfailure;
        }
        update();
      }
      else {
        statusRequest_absence = StatusRequest.offlinefailure;
      }
      update();
    }
    catch (_) {
      statusRequest_absence = StatusRequest.serverException;
      update();

    }
  }
  Future show_info_absence_Excused() async {
      details_absence_Excused = [];
    statusRequest_absence_Excused= StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
       //  (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/absence/Excused?token=$token")));
         (Uri.parse("$link/api/student/show/absence/reason")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );
          print(response.body);
          print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
          print(response.statusCode);
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => InPermanenceModel.fromJson(data))
              .toList();
       details_absence_Excused.addAll(c);
       print (details_absence_Excused.first.id);
          statusRequest_absence_Excused= StatusRequest.success;
        } else {
          statusRequest_absence_Excused= StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_absence_Excused= StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {

     statusRequest_absence_Excused= StatusRequest.serverException;
      update();

    }
  }
  Future  show_info_absence_Unexcused() async {
      details_absence_Unexcused = [];
     statusRequest_absence_Unexcused= StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
       //     (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/absence/Unexcused?token=$token")));
            (Uri.parse("$link/api/student/show/absence/unreason")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    ); if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => InPermanenceModel.fromJson(data))
              .toList();
            details_absence_Unexcused.addAll(c);
           statusRequest_absence_Unexcused= StatusRequest.success;
        } else {
           statusRequest_absence_Unexcused= StatusRequest.serverfailure;
        }
        update();
      } else {
         statusRequest_absence_Unexcused= StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
       statusRequest_absence_Unexcused= StatusRequest.serverException;
      update();

    }
  }
  Future<void> onRefresh() async {
    show_info_absence();
    show_info_absence_Excused();
    show_info_absence_Unexcused();
    update();
  }
}
