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


class Ads_Controller extends GetxController {

  bool isPermission = false;
  var checkAllPermissions = CheckPermission();


  StatusRequest statusRequest = StatusRequest.non;
  MyServices myServices = Get.find();
  List<FileModel> details = [];
  List<FileModel> detailsw = [];
  String ?token;
  int item=0;

  var oneORtwo = "0".obs;

  void changeoneORtwo(var val) {
    oneORtwo.value = val.toString();
    update();
  }

  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
   // show_info_file();
//    checkPermission();
    show_info_file(1);
    //add(0);

    super.onInit();
  }
  checkPermission() async {
    var permission = await checkAllPermissions.isStoragePermission();
    if (permission) {

      isPermission = true;

    }
  }



  void show_info_file(int type) async {
    details = [];
    statusRequest = StatusRequest.loading;
    update();
    print("((((((((((((((((((((((((((hjjjjjjjj)))))))))))))))))))))))))))))))");
    print(type);
    try {
      if (await checkInternet()) {
      //  var response = await http.get((Uri.parse("https://ma5znsyria.com/test/teacher.php?token=$token")));
        var response = await http.get((
            Uri.parse("$link/api/student/show/ads/$type")),
          headers:
        {"Authorization": "Bearer  $token"
        },
        );

        if (response.statusCode == 200 || response.statusCode == 201)
        {
        List jsonResponse = jsonDecode(response.body);
        print("_______________________");
        print(jsonResponse);
        print(response.body);

        var c = (jsonResponse as List)
            .map((data) => FileModel.fromJson(data))
            .toList();


        details.addAll(c);

        update();

        if (details.isEmpty){
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
    print('_____________________');
    print(statusRequest);
  }


  Future<void> onRefresh() async {
  show_info_file(1);
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



typee(int type)  async {


print (type);
    if(type==0) {
      return Icon(Icons.keyboard_voice);
    }else  if(type==1) {
      return Icon(Icons.key);
    }else  if(type==2) {
      return Icon(Icons.file_present);
    }else  if( type==3) {
      return Icon(Icons.account_balance_wallet_outlined);
    }else  if( type==4) {
      return Icon(Icons.remove);
    }else {
      return Icon(Icons.movie);
    }
  }


//
//
//   Future<Icon> reicon(String fg)  async {
//
//     String h= await  getFileType(fg);
//     List<String> parts = h.toString().split('/');
//     String type = parts[0]; // 'image'
//     String subtype = parts[1];
// print ("___________________________________");
// print (type);
//     if(type=='image') {
//       return Icon(Icons.perm_media_outlined);
//     }else  if(type=='audio') {
//       return Icon(Icons.multitrack_audio_sharp);
//     }else  if(type=='video') {
//       return Icon(Icons.video_library);
//     }else  if( type=='application') {
//       return Icon(Icons.file_present);
//     }else {
//       return Icon(Icons.movie);
//     }
//   }
//
//   Future<String> getFileType(String url) async {
//     final response = await http.head(Uri.parse( url));
//     final contentType = response.headers['content-type'];
//     final mimeType = lookupMimeType(url);
//
//
//     if (mimeType != null) {
//
//
//       return mimeType;
//     } else if (contentType != null) {
//
//
//       return contentType;
//     } else {
//
//
//       return 'application/octet-stream';
//     }
//
//
//   }
}
