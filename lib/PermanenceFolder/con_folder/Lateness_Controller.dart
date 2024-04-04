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
// lateness
class lateness_Controller extends GetxController  {
  StatusRequest statusRequest_lateness = StatusRequest.non;
  StatusRequest  statusRequest_lateness_Unexcused= StatusRequest.non;
  StatusRequest statusRequest_lateness_Excused= StatusRequest.non;
  MyServices myServices = Get.find();
  List<PermanenceModel>   details_lateness= [];
  List<InPermanenceModel>   details_lateness_Unexcused = [];
  List<InPermanenceModel>   details_lateness_Excused= [];
  String ?token;

  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
 show_info_lateness();

    super.onInit();
  }

  void     show_info_lateness() async {
    //details_lateness= [];
    statusRequest_lateness = StatusRequest.loading;
    update();
    try {

      if (await checkInternet()) {
        var response = await http.get(
            // (Uri.parse(
            //     "https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/lateness?token=$token")));

            (Uri.parse("$link/api/student/index/delay")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );
        print("in let info________________");
        print(response.body);
        print(response);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
          Map<String, dynamic>  jsonResponse = jsonDecode(response.body);
          var c = PermanenceModel.fromJson(jsonResponse);

          details_lateness.add(c);
         print(details_lateness.length);
          statusRequest_lateness = StatusRequest.success;
        } else {
          statusRequest_lateness = StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_lateness = StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_lateness = StatusRequest.serverException;
      update();

    }
  }
  Future show_info_lateness_Excused() async {
    details_lateness_Excused = [];
    statusRequest_lateness_Excused= StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
        //    (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/lateness/Excused?token=$token")));
            (Uri.parse("$link/api/student/show/delay/reason")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );
        if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => InPermanenceModel.fromJson(data))
              .toList();
          details_lateness_Excused.addAll(c);
          statusRequest_lateness_Excused= StatusRequest.success;
        } else {
          statusRequest_lateness_Excused= StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_lateness_Excused= StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_lateness_Excused= StatusRequest.serverException;
      update();

    }
  }
  Future  show_info_lateness_Unexcused() async {
    details_lateness_Unexcused = [];
    statusRequest_lateness_Unexcused= StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
         //   (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/lateness/Unexcused?token=$token")));
            (Uri.parse("$link/api/student/show/delay/unreason")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );  if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => InPermanenceModel.fromJson(data))
              .toList();
          details_lateness_Unexcused.addAll(c);
          statusRequest_lateness_Unexcused= StatusRequest.success;
        } else {
          statusRequest_lateness_Unexcused= StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_lateness_Unexcused= StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_lateness_Unexcused= StatusRequest.serverException;
      update();

    }
  }
  Future<void> onRefresh() async {
    show_info_lateness();
    show_info_lateness_Excused();
    show_info_lateness_Unexcused();
    update();
  }
}
