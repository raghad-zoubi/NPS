import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';
import '../../data/model/Profile_Model.dart';

import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';
import '../../data/model/Profile_Model.dart';
import '../../data/model/Program_Model.dart';
import '../../linkapi.dart';
import '../../main.dart';



class Program_Controller extends GetxController {
  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List<ProgramModel> details = [];
  List<String> deto = [];
  List<String> de1 = [];
  List<String> de2 = [];
  List<String> de3 = [];
  List<String> de4= [];
  List<String> de5 = [];
  List<String> de6 = [];
  List<String> de7 = [];
  List<String> de8 = [];
  String ?token;
  @override
  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
    print("in onInit of Program_Controller");
    print("__________________________");
    //token = myServices.sharedPreferences.getString("token")!;
    show_info_program();
    super.onInit();
  }

  void show_info_program() async {
    details = [];
    statusRequest = StatusRequest.loading;
    update();
    try {

      if (await checkInternet())
      {
        var response = await http.get((Uri.parse(
            "$link/api/student/show/program")),
            headers:{"Authorization": "Bearer  $token"} )
            .timeout(const Duration(seconds: 20), onTimeout: () {
          throw TimeoutException("connection time out try agian")
          ;
        }
        );
        print(response.body);
        print("________________");
        if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse as List)
              .map((data) => ProgramModel.fromJson(data))
              .toList();

          details.addAll(c);
          if(details.isEmpty){
          statusRequest = StatusRequest.noData;
            update();
          }

else {
            printdata(details);

            statusRequest = StatusRequest.success;
            update();
          } }  else {
          statusRequest = StatusRequest.serverfailure;
        }
        update();
      }

      else {
        statusRequest = StatusRequest.offlinefailure;
      }
      update();
    } catch (_) {
      statusRequest = StatusRequest.serverException;
      update();

    }
  }



  Future<void> onRefresh() async {
    show_info_program();
    update();
  }

  void printdata(List<ProgramModel> details)
  {
    print("_________________________");
    for(int i=0;i<details.length;i++)
    {
      print(details[i].name);
      if(details[i].day=='الأحد')
        de1.add(details[i].name);
      if(details[i].day=='الاثنين')
        de2.add(details[i].name);
      if(details[i].day=='الثلاثاء')
        de3.add(details[i].name);
      if(details[i].day=='الأربعاء')
        de4.add(details[i].name);
      if(details[i].day=='الخميس')
        de5.add(details[i].name);
      if(details[i].day=='السيت')
        de6.add(details[i].name);
    }

    print("_________________________");




  }
}
