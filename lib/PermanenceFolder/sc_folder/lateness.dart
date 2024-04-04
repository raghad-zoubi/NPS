import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nps/core/class/handlingdataview.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:nps/PermanenceFolder/con_folder/Lateness_Controller.dart';
import '../../core/function/_settingModalBottomSheet.dart';
import '../../core/constant/color.dart';
import '../con_folder/Permanences_Contoller.dart';
import '../mod_folder/Permanence_Model.dart';

class Lateness extends StatelessWidget {
 //var controller = Get.put(lateness_Controller());
  List<PermanenceModel> let = [];
  late permanence_Controller controller;

  Lateness({required lateness_Controller controller3});

 // Lateness({required this.let});


    @override
    Widget build(BuildContext context) {

      return

          GetBuilder<lateness_Controller>(
              builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest_lateness,
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
                                Text("التأخير الكليّّ ",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 22.0,
                                        color: AppColor.purple1)),
                                Text("${controller.details_lateness.first.allCount}",
                                    style:  TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 22.0,
                                        color: AppColor.redso))
                              ]),
                          footer:   Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              children: [
                                // Text(
                                //   " ",
                                //   style: new TextStyle(fontWeight: FontWeight.w300, fontSize: 15),
                                // ),

                              ]),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: AppColor.blue_splash,
                        ),

                        Padding(padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 30),
                            child:
                            ListTile(
                              trailing: Icon(Icons.arrow_circle_down_outlined,size: 40),
                              onTap:()  async {

                                if("${controller.details_lateness.first.excusedCount}"!='0'){
    await controller.show_info_lateness_Excused();


    //sittengmodalbottomSheet(context,"1a",AppColor.purple1);
    df(context,"1l",AppColor.purple1,controller.details_lateness_Excused,controller.statusRequest_lateness_Excused);}
                                else
                                  Get.defaultDialog(
                                      title: ' ',
                                      titleStyle:  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
                                    middleText: "لايوجد أذونات لعرضها"
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
                                "التأخير المبرر",
                                style: TextStyle(color: AppColor.white,fontSize: 20),
                              ),),
                              subtitle:   Center(child:Text("${controller.details_lateness.first.excusedCount}",
                                style: TextStyle(color: AppColor.white,fontSize: 20),

                              ),),

                            )
                        ),

                        Padding(padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top:30),
                            child:
                            ListTile(
                              onTap:()async {
                                if("${controller.details_lateness.first.unexcusedCount}"!='0') {
                                  await controller
                                      .show_info_lateness_Unexcused();


                                  //sittengmodalbottomSheet(context,"1a",AppColor.purple1);
                                  df(context, "2l", AppColor.orang1,
                                      controller.details_lateness_Unexcused,
                                      controller
                                          .statusRequest_lateness_Unexcused);
                                }
                                else
                                  Get.defaultDialog(
                                      title: ' ',
                                      titleStyle:  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
                                      middleText: "لايوجد تأخيرات لعرضها"
                                  );
                                },

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
                                "التأخير  غير المبرر",
                                style: TextStyle(color: AppColor.white,fontSize: 20),
                              ), ),
                              subtitle:
                              Center(child: Text("${controller.details_lateness.first.unexcusedCount}",
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

