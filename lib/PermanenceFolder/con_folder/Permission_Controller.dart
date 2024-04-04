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
// permission
// absence
class permission_Controller extends GetxController {
  StatusRequest statusRequest_permission = StatusRequest.non;
  StatusRequest statusRequest_permission_in= StatusRequest.non;
  MyServices myServices = Get.find();
  List<PermanenceModel>   details_permission= [];
  List<InPermanenceModel>   details_permission_in= [];
  String ?token;

  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
 show_info_permission();
    // show_info_permission_in();
    // show_info_permission_Unexcused();

    super.onInit();
  }

  void     show_info_permission() async {
  //  details_permission= [];
    statusRequest_permission = StatusRequest.loading;
    update();
    String token = myServices.sharedPreferences.getString("token")!;

    try {
      if (await checkInternet()) {
        var response = await http.get(
          //      (Uri.parse("pop")));
        // (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/permission?token=$token")));
            (Uri.parse("$link/api/student/index/permission")),
            headers: {"Authorization": "Bearer  $token"})
            .timeout(const Duration(seconds: 20), onTimeout: () {

          throw TimeoutException("connection time out try agian")
          ;
        }
        );

        if (response.statusCode == 200 || response.statusCode == 201) {


          Map<String, dynamic>  jsonResponse = jsonDecode(response.body);
          var c =PermanenceModel.fromJson(jsonResponse);

          details_permission.add(c);
          print(" perj");
          print(response.body);
          print(details_permission.first.allCount);
          statusRequest_permission = StatusRequest.success;
        } else {
          statusRequest_permission = StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_permission = StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_permission = StatusRequest.serverException;
      update();

    }
  }
  //
  // void show_so_permission() async {
  //   statusRequest_permission= StatusRequest.loading;
  //   update();
  // //  String token = myServices.sharedPreferences.getString("token")!;
  //   try {
  //     if (await checkInternet()) {
  //       var response = await http.get(
  // (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/permission?token=$token")));
  //         //    (Uri.parse("$link/api/student/show/permission")),
  //       //    headers: {"Authorization": "Bearer  $token"});
  //       if (response.statusCode == 200 || response.statusCode == 201) {
  //         List jsonResponse = jsonDecode(response.body);
  //         var c = (jsonResponse as List)
  //             .map((data) => PermanenceModel.fromJson(data))
  //             .toList();
  //         details_permission.addAll(c);
  //         statusRequest_permission= StatusRequest.success;
  //       } else {
  //         statusRequest_permission= StatusRequest.serverfailure;
  //       }
  //       update();
  //     } else {
  //       statusRequest_permission= StatusRequest.offlinefailure;
  //     }
  //     update();
  //   } catch (_) {
  //     statusRequest_permission= StatusRequest.serverException;
  //     update();
  //   }
  // }
  Future show_info_permission_in() async {
    details_permission_in = [];
    statusRequest_permission_in= StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
          //  (Uri.parse("https://6cd05d08-5633-4be3-af3e-474d51fafc1d.mock.pstmn.io/api/student/permanence/permission/in?token=$token")));
            (Uri.parse("$link/api/student/show/permission")),
            headers: {"Authorization": "Bearer  $token"})
            .timeout(const Duration(seconds: 20), onTimeout: () {

          throw TimeoutException("connection time out try agian")
          ;
        }
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => InPermanenceModel.fromJson(data))
              .toList();
          details_permission_in.addAll(c);
          statusRequest_permission_in= StatusRequest.success;
        } else {
          statusRequest_permission_in= StatusRequest.serverfailure;
        }
        update();
      } else {
        statusRequest_permission_in= StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest_permission_in= StatusRequest.serverException;
      update();

    }
  }

  Future<void> onRefresh() async {
    show_info_permission();
    show_info_permission_in();

    update();
  }
}
