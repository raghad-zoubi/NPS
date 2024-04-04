import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';

import '../../data/model/Budgets_Model.dart';
import '../../data/model/Profile_Model.dart';
import '../../main.dart';


class Budgets_Controller extends GetxController {

  int? total;
  int? sum;
  int? still;
  double? percent = 0.0;
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List<Premiums_Model> details = [];
  List<dynamic> c = [];
  String ?token;

  void onInit() async{
    token = myServices.sharedPreferences.getString("token")!;
    update();
   await show_payment();
    super.onInit();
  }


  Future<void> show_payment() async {
print("fsdfg");
statusRequest = StatusRequest.loading;
update();
    print('hada');
    print(statusRequest);
    try {
      if (await checkInternet()) {
        var response = await http.get(
            (Uri.parse(
                "$link/api/student/show/Premium")),
            headers: {"Authorization": "Bearer  $token"}
        ) .timeout(const Duration(seconds: 20), onTimeout: () {

          throw TimeoutException("connection time out try agian")
          ;
        }
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
          print(response.statusCode);
          print("_____________________");
          //  var jsonResponse = jsonDecode(response.body);
              Map<String, dynamic>  jsonRespons= jsonDecode(response.body);
     //  var c = Premiums_Model.fromJson(jsonRespons);
       print('dddddddddd');
        c =jsonRespons['premiums'].toList();

   update();print(c[0]["id"]);
       print('dddddddddd');

          // var c =(jsonResponse as List)
          //     .map((data) => Premiums_Model.fromJson(data))
          //     .toList();

print(jsonRespons["still"]);

sum=jsonRespons["sum"];
still=jsonRespons["still"];
total=jsonRespons["total"];
          percent=sum!/total!;
          //jsonRespons["percent"];
// still=jsonRespons["still"];
update();


          if (!c.isEmpty) {
            print (c.length);

       //    details.first.percent=details.first.sum!/details.first.total!;
          }
//
          if (c.isEmpty) {
            statusRequest = StatusRequest.noData;
            update();
          }



          else {
            statusRequest = StatusRequest.success;
            update();
          }
        }

        else {
          statusRequest = StatusRequest.serverfailure;
          update();
        }
        update();
      } else {
        statusRequest = StatusRequest.offlinefailure;
      }
      update();
    }


    catch (e) {
      print(e);
      statusRequest = StatusRequest.serverException;
      update();

    }
    update();
  }




  Future<void> onRefresh() async {

    update();
  }
}
