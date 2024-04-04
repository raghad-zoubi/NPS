import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';
import '../../data/model/Profile_Model.dart';
import '../../main.dart';
import '../mod_folder/Permanence_Model.dart';



// permission
// lateness
// absence
class permanence_Controller extends GetxController {
  StatusRequest statusRequest_absence = StatusRequest.non;
  StatusRequest statusRequest_lateness= StatusRequest.non;
  StatusRequest statusRequest_permission= StatusRequest.non;
  MyServices myServices = Get.find();
  List<PermanenceModel> details_permission = [];
  List<PermanenceModel> details_lateness = [];
  List<PermanenceModel> details_absence = [];
  String ?token;

  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
 show_info_Absence();
 //show_info_Permission();
  //show_info_Lateness();

    super.onInit();
  }

  void     show_info_Absence() async {
    details_absence = [];
    statusRequest_absence = StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
 // (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/absence?token=$token")));

            (Uri.parse("$link/api/student/index/absence")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );

        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print('abs');
          print(response.body);
          Map<String, dynamic>  jsonResponse = jsonDecode(response.body);
          // var c = (jsonResponse as List)
          //     .map((data) => PermanenceModel.fromJson(data))
          //     .toList();
          var c = PermanenceModel.fromJson(jsonResponse);

          print("in pre abs info________________");

          print(response);
          details_absence.add(c);
          print(details_absence.first.allCount);
          statusRequest_absence = StatusRequest.success;
        } else {
          statusRequest_absence = StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_absence = StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_absence = StatusRequest.serverException;
      update();

    }
  }
  void show_info_Permission() async {
    details_permission  = [];
    statusRequest_permission= StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
            //(Uri.parse("https://c604b723-6dcd-43b5-83ca-40449b24d24d.mock.pstmn.io/api/student/notes/a?token=$token")));
            (Uri.parse("$link/api/student/index/permission")),
            headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map<String, dynamic>  jsonResponse = jsonDecode(response.body);
          // var c = (jsonResponse as List)
          //     .map((data) => PermanenceModel.fromJson(data))
          //     .toList();
          var c = PermanenceModel.fromJson(jsonResponse);

          details_permission .add(c);
          print("prehhhhhhhhhhhhh per");
          print(response.body);
          print(details_permission.first.allCount);
          statusRequest_permission= StatusRequest.success;
        } else {
          statusRequest_permission= StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_permission= StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_permission= StatusRequest.serverException;
      update();

    }
  }
  void  show_info_Lateness() async {
    details_lateness = [];
    statusRequest_lateness= StatusRequest.loading;
    update();
    try {

      if (await checkInternet()) {
        var response = await http.get(
            (Uri.parse("$link/api/student/index/delay")),
           headers: {"Authorization": "Bearer  $token"})  .timeout(const Duration(seconds: 20), onTimeout: () {

    throw TimeoutException("connection time out try agian")
    ;
    }
    );

      //  var response = await http.get((Uri.parse("https://c604b723-6dcd-43b5-83ca-40449b24d24d.mock.pstmn.io/api/student/notes/a?token=$token")));
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          print('lat');
          print(response.body);
          Map<String, dynamic>  jsonResponse = jsonDecode(response.body);
          // var c = (jsonResponse as List)
          //     .map((data) => PermanenceModel.fromJson(data))
          //     .toList();
          var c = PermanenceModel.fromJson(jsonResponse);

          print(response.body);
          print(response);
          print(response.statusCode);
        details_lateness.add(c);
          print("in pre let info________________");
          print(details_lateness.length);
          statusRequest_lateness= StatusRequest.success;
        } else {
          statusRequest_lateness= StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_lateness= StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_lateness= StatusRequest.serverException;
      update();

    }
  }
  Future<void> onRefresh() async {
    show_info_Absence();
    show_info_Permission();
    show_info_Lateness();
    update();
  }
}
