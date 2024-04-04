import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:nps/PermanenceFolder/con_folder/Absence_Controller.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/function/_settingModalBottomSheet.dart';
import '../con_folder/Permanences_Contoller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import 'package:get/get.dart';

class absence extends StatelessWidget {
  absence_Controller controller2;


  absence({required this.controller2});
  var controller = Get.put(absence_Controller());

  @override
  Widget build(BuildContext context) {

    return      GetBuilder<absence_Controller>(
        builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest_absence,
        widget:
        Padding(
              padding: EdgeInsets.only(top:20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularPercentIndicator(
                          radius: 100.0,
                          lineWidth: 2.0,
                          animation: false,
                          percent: 1,
                          center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("الغياب الكليّّ ",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22.0,
                                        color: AppColor.purple1)),
                                Text("${controller2.details_absence.first.allCount}",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25.0,
                                        color: AppColor.redso))
                              ]),
                          footer:   Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                Text(
                                  ' عدد أيام الدوام الكلي : 178 يوم تقريبا'
                                  ,
                                  style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                                ),

                              ]),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColor.blue_splash,
                        ),
  Padding(padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 30),
  child:
  ListTile(
trailing: Icon(Icons.arrow_circle_down_outlined,size: 40),
    onTap:() async {
  if("${controller2.details_absence.first.excusedCount}"!='0') {
    await controller.show_info_absence_Excused();
    print(controller.statusRequest_absence_Excused);

    //sittengmodalbottomSheet(context,"1a",AppColor.purple1);
    df(context, "1a", AppColor.purple1, controller.details_absence_Excused,
        controller.statusRequest_absence_Excused);
  }
  else
    Get.defaultDialog(
        title: ' ',
        titleStyle:  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
        middleText: "لايوجد غيابات لعرضها"
    );
      } ,
     minVerticalPadding:1,
    iconColor:AppColor.white,
     minLeadingWidth: 30,
   horizontalTitleGap: 78,
tileColor: AppColor.purple1,
    shape: RoundedRectangleBorder( //<-- SEE HERE


      borderRadius: BorderRadius.circular(20),
    ),


    title:Center(child: Text(
      "الغياب المبرر",
      style: TextStyle(color: AppColor.white,fontSize: 20),
    ),),
    subtitle:   Center(child:Text("${controller2.details_absence.first.excusedCount}",
    style: TextStyle(color: AppColor.white,fontSize: 20),

    ),),

  )
),

  Padding(padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 30),
  child:
  ListTile(
    onTap:()

    async {
      if("${controller2.details_absence.first.unexcusedCount}"!='0'){
    await controller.show_info_absence_Unexcused();
    df(context,"2a",AppColor.orang1,controller.details_absence_Unexcused,controller.statusRequest_absence_Unexcused);
    }
    else
    Get.defaultDialog(
    title: ' ',
    titleStyle:  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
    middleText: "لايوجد غيابات لعرضها"
    );} ,
trailing: Icon(Icons.arrow_circle_down_outlined,size: 40),
     minVerticalPadding:1,
    iconColor:AppColor.white,
     minLeadingWidth: 30,
   horizontalTitleGap: 78,
tileColor: AppColor.orang1,
    shape: RoundedRectangleBorder( //<-- SEE HERE


      borderRadius: BorderRadius.circular(20),
    ),


    title: Center(child:Text(
      "الغياب  غير المبرر",
      style: TextStyle(color: AppColor.white,fontSize: 20),
    ), ),
    subtitle:
    Center(child: Text("${controller2.details_absence.first.unexcusedCount}",
      style: TextStyle(color: AppColor.white,fontSize: 20),

    ),),

  )
)





                      ],
                    ),
                  ),

                ],
              ),
            )

    ))
         ;
  }


}
