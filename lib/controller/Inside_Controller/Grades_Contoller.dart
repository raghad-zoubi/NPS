import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:nps/core/services/services.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/function/checkinternet.dart';
import '../../data/model/Grades_Model.dart';
import '../../data/model/Profile_Model.dart';
import '../../data/model/SubjectModel.dart';
import '../../main.dart';

class Grades_Controller extends GetxController {
   List<String> det=[] ;
   String? selectedDate ;
   String?dateCount ;
   String? range ;
   String? from ;
   String? to ;
   String? rangeCount ;

  StatusRequest statusRequest_subject = StatusRequest.non;
  StatusRequest statusRequest_grades = StatusRequest.non;
  MyServices myServices = Get.find();
  List<GradesModel> details_grades = [];
  List<SubjectsModel> details_subject = [];
  String ?token;
  String? selectedValue1;
  String? selectedValue2;
  StatusRequest statusRequest = StatusRequest.non;
 // var language = <String>['English', 'Espanol'];

  void onSelected1(String value) {
    selectedValue1 = value;

    update();

    print(selectedValue1);
    //changeLanguage(selectedValue);
  }
  void onSelected2(String value) {
    selectedValue2 = value;

    update();

    print(selectedValue2);
    //changeLanguage(selectedValue);
  }


  void onInit() {
    token = myServices.sharedPreferences.getString("token")!;
    update();
    show_info_subject();
    super.onInit();
  }
   int y=-1;
String find_id(){

  for(int i=0;i<details_subject.length;i++)
  if(details_subject[i].name.toString()==selectedValue1){
y= details_subject[i].id;
  update();}
    return '$y';

}
   void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {

     if (args.value is PickerDateRange) {
       range = '${DateFormat('yyyy/MM/dd').format(args.value.startDate)} -'
       // ignore: lines_longer_than_80_chars
           ' ${DateFormat('yyyy/MM/dd').format(args.value.endDate ?? args.value.startDate)}';
     } else if (args.value is DateTime) {
       selectedDate = args.value.toString();
     } else if (args.value is List<DateTime>) {
       dateCount = args.value.length.toString();
     } else {
       rangeCount = args.value.length.toString();


     }


     void onInit() {

       super.onInit();
     }

     Future<void> onRefresh() async {

       update();
     }

   }

  void show_info_subject() async {
    details_subject = [];
    det = [];
    statusRequest_subject = StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.get(
            (Uri.parse(
           "$link/api/student/show/subject")),
            headers: {"Authorization": "Bearer  $token"}
       // )
        //     .timeout(const Duration(seconds: 20), onTimeout: () {
        //
        //   throw TimeoutException("connection time out try agian")
        //   ;
        // }
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
          print(response.statusCode);
          print("_____________________");
          var jsonResponse = jsonDecode(response.body);
          var c = (jsonResponse  as List)
              .map((data) => SubjectsModel.fromJson(data))
              .toList();
      print(jsonResponse);
        details_subject.addAll(c);
          print(jsonResponse);

          if(details_subject.isNotEmpty){
          for(int i=0;i<details_subject.length;i++)
            det.add(details_subject.elementAt(i).name);
        update();}





          statusRequest_subject = StatusRequest.success;
          update();

        }

        else {
          statusRequest_subject = StatusRequest.serverfailure;
          update();
        }
        update();
      } else {
        statusRequest_subject = StatusRequest.offlinefailure;
        update();  }
      update();
    }


    catch (_) {
      print("eeeeeeeeeerrrrrrrrrror");
      statusRequest_subject = StatusRequest.serverException;
      update();

    }
  }

  void show_info_grade() async {
   if( find_id()=='-1')
    Get.defaultDialog(
        title: "تنبيه",
        titleStyle:  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
        middleText: " يرجى تحديد المادة"
    );
 else {

     value_range();
print(range);
print(from);
print(to);

    String idsub = find_id();
    details_grades = [];
    statusRequest_grades = StatusRequest.loading;
    update();
    try {
      if (await checkInternet()) {
        var response = await http.post((
            Uri.parse("$link/api/student/show/mark")), headers:
        {"Authorization": "Bearer  $token"},
          // body: {"id": '61', "from": "2023-02-10", "to": "2023-06-21"},
         body: {"id": idsub, "from": from, "to": to},
          //?token=$token&idsub=$idsub&from=$from")));
        )  .timeout(const Duration(seconds: 20), onTimeout: () {

          throw TimeoutException("connection time out try agian")
          ;
        }
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          print(response.body);
          print(response.statusCode);
          var jsonResponse = jsonDecode(response.body);


          var c = (jsonResponse as List)
              .map((data) => GradesModel.fromJson(data))
              .toList();
          details_grades.addAll(c);
          print('hhhhhhhhhhhhhhhhh');
     //     print(details_grades.first.highMark);
          if(details_grades.isEmpty){
            statusRequest_grades = StatusRequest.noData;
            update();
          }

          else {
            statusRequest_grades = StatusRequest.success;
            update();
          }
        }
        else {
          statusRequest_grades = StatusRequest.serverfailure;
          update();
        }
      }
      else {
        statusRequest_grades = StatusRequest.offlinefailure;
        update();  }

    } catch (_) {
      statusRequest_grades = StatusRequest.serverException;
      update();
    }
//    print(statusRequest_grades);
}
  }
  Future<void> onRefresh() async {
    show_info_subject();
    show_info_grade();
    update();
  }
bool value_range() {
  bool f;
  print(find_id());
 if( y==-1)
   f= false;
  else
    f= true;


  if (range == null){
    int m = DateTime
        .now()
        .month; //.subtract(const Duration(days: 4));
  int d = DateTime
      .now()
      .day; //.subtract(const Duration(days: 4));
  int y = DateTime
      .now()
      .year; //.subtract(const Duration(days: 4));

  range = '$d/$m/$y';
  from = '$d-$m-$y';
  to = '$d-$m-$y';
  update();
}
else
  {  //List<String> formattedDates = formatDateRange(range!);
    String dateRange= range!;
  List<String> dates = dateRange.split(' - ');

  from=(dates[0].replaceAll('/', '-'));
to=(dates[1].replaceAll('/', '-'));
update();
  }

return f;
}


}