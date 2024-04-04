// import 'dart:convert';
//
// import 'package:nps/core/function/checkinternet.dart';
// import 'package:nps/core/services/services.dart';
// import 'package:nps/data/model/Student_Model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// //import 'package:image_picker/image_picker.dart';
// import 'package:http/http.dart' as http;
// import '../core/class/statusrequest.dart';
//
// class Studets_Controller extends GetxController {
//   StatusRequest statusRequest = StatusRequest.non;
//   MyServices myServices = Get.find();
//   List<StudentModel> students = [];
//
//   void onInit() {
//     showStudent();
//     super.onInit();
//   }
//
//   showStudent() async {
//     statusRequest = StatusRequest.loading;
//     update();
//     String token = myServices.sharedPreferences.getString("token")!;
//     try {
//       if (await checkInternet()) {
//         var response = await http.get((Uri.parse(
//             "https://ma5znsyria.com/test/students.php?token=$token")));
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           List jsonResponse = jsonDecode(response.body);
//           var c = (jsonResponse as List)
//               .map((data) => StudentModel.fromJson(data))
//               .toList();
//           students.addAll(c);
//           statusRequest = StatusRequest.success;
//         } else {
//           statusRequest = StatusRequest.serverfailure;
//         }
//         update();
//       } else {
//         statusRequest = StatusRequest.offlinefailure;
//       }
//       update();
//     } catch (_) {
//       statusRequest = StatusRequest.serverException;
//       update();
//     }
//   }
// }
