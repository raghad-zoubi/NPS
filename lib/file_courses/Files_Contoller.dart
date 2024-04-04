import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import 'package:nps/core/services/services.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/checkinternet.dart';

import '../main.dart';
import 'File_Model.dart';
import 'check_permission.dart';


class File_Controller extends GetxController {

  bool isPermission = false;
  var checkAllPermissions = CheckPermission();


  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List<FileModel> details = [];
  List<FileModel> detailsw = [];
  String ?token;
  int item = 0;
  String it = "records";
  Icon iconed = Icon(Icons.keyboard_voice);

  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
    // show_info_file();
//    checkPermission();
    show_info_file(it);
    //add(0);

    super.onInit();
  }

  checkPermission() async {
    var permission = await checkAllPermissions.isStoragePermission();
    if (permission) {
      isPermission = true;
    }
  }


  void show_info_file(String type) async {
    details = [];
    statusRequest = StatusRequest.loading;
    update();
    print("(((((((((((((((((((((((((()))))))))))))))))))))))))))))))");
    print(type);
    try {
      if (await checkInternet()) {
        //  var response = await http.get((Uri.parse("https://ma5znsyria.com/test/teacher.php?token=$token")));
        var response = await http.get((
            Uri.parse("$link/api/student/show/workingpaper/$type")),
          headers:
          {"Authorization": "Bearer  $token"
          },).timeout(const Duration(seconds: 100), onTimeout: () {
          throw TimeoutException("connection time out try agian")
          ;
        }
        );
        print("_______________________");
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          List jsonResponse = jsonDecode(response.body);

          var c = (jsonResponse as List)
              .map((data) => FileModel.fromJson(data))
              .toList();


          details.addAll(c);

          update();
          if (details.isEmpty) {
            statusRequest = StatusRequest.noData;
            update();
          }

          else {
            statusRequest = StatusRequest.success;
            update();
          }
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
    show_info_file("records");
    update();
  }

  // Future<void> add(int type) async {
  //
  //     statusRequest = StatusRequest.success;
  // detailsw=[];
  //   detailsw = [
  //     FileModel(
  //       id: "3",
  //       title: "file Video 2",
  //
  //       name: "https://download.samplelib.com/mp4/sample-20s.mp4"
  //       ,    icon: Icon(Icons.perm_media_outlined),
  //       //reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")
  //     ),
  //     FileModel(
  //       id: "4",
  //       title: "file Video 3",
  //       name: "https://download.samplelib.com/mp4/sample-15s.mp4"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //     ),
  //     FileModel(
  //       id: "5",
  //       title: "file Video 4",
  //       name: "https://download.samplelib.com/mp4/sample-10s.mp4"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //       //icon: reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")),
  //     ),
  //     FileModel(
  //       id: "6",
  //       title: "file PDF 6",
  //
  //       name: "https://www.irs.gov/pub/irs-pdf/p463.pdf"
  //       ,
  //
  //       icon:  Icon(Icons.perm_media_outlined),//  icon: reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")
  //     ),
  //     FileModel(
  //       id: "10",
  //       title: "file PDF 7",
  //       name: "https://www.irs.gov/pub/irs-pdf/p463.pdf"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //       //icon: reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")),
  //     ),
  //     FileModel(
  //       id: "10",
  //       title: "C++ Tutorial",
  //       name: "https://www.irs.gov/pub/irs-pdf/p463.pdf"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //       //icon: reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")),
  //     )
  //     ,FileModel(
  //       id: "11",
  //       title: "file PDF 9",
  //       name: "https://www.irs.gov/pub/irs-pdf/p463.pdf"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //       //icon: reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")),
  //     ),
  //     FileModel(
  //       id: "12",
  //       title: "file PDF 10",
  //       name: "https://www.irs.gov/pub/irs-pdf/p463.pdf"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //       //icon: reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")),
  //     ),
  //     FileModel(
  //       id: "13",
  //       title: "file PDF 12",
  //       name: "https://www.irs.gov/pub/irs-pdf/p463.pdf"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //       //icon: reicon( "https://www.tutorialspoint.com/css/css_tutorial.pdf")),
  //     ),
  //     FileModel(
  //       id: "14",
  //       title: "file PDF 11",
  //       name: "https://www.tutorialspoint.com/css/css_tutorial.pdf"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //     ),
  //     FileModel(
  //       id: "15",
  //       title: " https://www.tutorialspoint.com/css/css_tutorial.pdf file PDF 11 https://www.tutorialspoint.com/css/css_tutorial.pdf",
  //       name: "null"
  //       ,
  //       icon:  Icon(Icons.perm_media_outlined),
  //     ),
  //   ];
  //
  //   for (int i=0;i<detailsw.length;i++) {
  //     Icon b = await typee(type);
  //     detailsw[i].icon = b;
  //   }
  //
  //     update();
  //
  // }


  icone(int id) async {
    print(id);
    if (id == 0) {
      iconed = Icon(Icons.keyboard_voice, color: Colors.blue,);
      update();
    } else if (id == 1) {
      iconed = Icon(Icons.key, color: Colors.blue,);
      update();
    } else if (id == 2) {
      iconed = Icon(Icons.file_present, color: Colors.blue,);
      update();
    } else if (id == 3) {
      iconed = Icon(Icons.account_balance_wallet_outlined, color: Colors.blue,);
      update();
    } else if (id == 4) {
      iconed = Icon(Icons.text_fields, color: Colors.blue,);
      update();
    }
    else {
      iconed = Icon(Icons.ac_unit_sharp, color: Colors.blue,);
      update();
    }
  }

  void changeColor(int i) {

  }


}
