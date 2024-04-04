import 'package:flutter/material.dart';

import '../../core/class/handlingdataview.dart';
import '../con_folder/Absence_Controller.dart';
import '../con_folder/Lateness_Controller.dart';
import '../con_folder/Permanences_Contoller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import 'package:get/get.dart';

import '../con_folder/Permission_Controller.dart';
import 'absence.dart';
import 'lateness.dart';
import 'permission.dart';

class permanence extends StatelessWidget {
  var controller = Get.put(permanence_Controller());
  var controller2 = Get.put(absence_Controller());
  var controller3 = Get.put(lateness_Controller());
  var controller4 = Get.put(permission_Controller());

  @override
  Widget build(BuildContext context) {
    return
          Scaffold(
          body: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColor.primaryColor,
                  title: Text(
                    "   مدرسة الأهلية الوطنية  ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  // actions: <Widget>[
                  //   IconButton(
                  //       icon: Icon(Icons.arrow_forward_sharp),
                  //       onPressed: () {
                  //         Get.offAllNamed(AppRoutes.Home);
                  //       })
                  // ],
                  elevation: 2,
                  bottom: TabBar(
                      onTap: (index) {

                        if(index==0)
                          controller.show_info_Absence();
                        else      if(index==1)
                          controller.show_info_Lateness();
                        else if(index==2)
                          controller.show_info_Permission();
                      },
                      labelColor: Color(0xff499AF6),
                      unselectedLabelColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          color: Colors.white),
                      tabs: [
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  "غياب") //,style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  "تأخير") //,style: TextStyle(fontSize: 20)),
                          ),
                        ),
                        Tab(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  "إذن") //,style: TextStyle(fontSize: 20)),
                          ),
                        ),
                      ]),
                ),
                body: TabBarView(children: [
                  //   Icon(Icons.games ),

                  GetBuilder<absence_Controller>(

                    builder: (controller2) =>  HandlingDataView(
                      statusRequest: controller2.statusRequest_absence,
                      widget: absence(controller2:controller2),
                    ),),
                  GetBuilder<lateness_Controller>(

                    builder: (controller3) =>  HandlingDataView(
                      statusRequest: controller3.statusRequest_lateness,
                      widget: Lateness(controller3:controller3),
                    ),),

                  GetBuilder<permission_Controller>(

                    builder: (controller4) =>  HandlingDataView(
                      statusRequest: controller4.statusRequest_permission,
                      widget: permission(controller4:controller4),),),

                ]),
              )));
  }
}

//
//
// class permanence extends StatelessWidget {
//     var controller = Get.put(permanence_Controller());
//   var controller2 = Get.put(absence_Controller());
//   var controller3 = Get.put(lateness_Controller());
//   var controller4 = Get.put(permission_Controller());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: DefaultTabController(
//         length: 2,
//         initialIndex: 0,
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: AppColor.primaryColor,
//             title: Text(
//               "   مدرسة الأهلية الوطنية  ",
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             actions: <Widget>[
//               IconButton(
//                   icon: Icon(Icons.arrow_forward_sharp),
//                   onPressed: () {
//                     Get.offAllNamed(AppRoutes.Home);
//                   })
//             ],
//             elevation: 2,
//             bottom: TabBar(
//                 onTap: (index) {
//                   if(index==0)
//                           controller.show_info_Absence();
//                         else      if(index==1)
//                           controller.show_info_Lateness();
//                 },
//                 labelColor: Color(0xff499AF6),
//                 unselectedLabelColor: Colors.white,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 indicator: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(10)),
//                     color: Colors.white),
//                 tabs: [
//                 Tab(
//                           child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                   "غياب") //,style: TextStyle(fontSize: 20)),
//                           ),
//                         ),
//                         Tab(
//                           child: Align(
//                               alignment: Alignment.center,
//                               child: Text(
//                                   "تأخير") //,style: TextStyle(fontSize: 20)),
//                           ),
//                         ),
//                 ]),
//           ),
//           body:
//           // Padding(
//           //   padding: EdgeInsets.only(top: 20.0),
//           //   child: )
//           TabBarView(children: [
//             GetBuilder<permanence_Controller>(
//               builder: (controller) => HandlingDataView(
//                 statusRequest: controller.statusRequest_absence,
//                 widget:absence( allCount :controller.details_absence.first.allCount,
//                     UnexcusedCount:controller.details_absence.first.unexcusedCount,
//                     excusedCount:controller.details_absence.first.excusedCount,
//               //      days:controller.details_lateness.first.days
//                 )
//
//               ),
//             ),
//             //),
//             GetBuilder<permanence_Controller>(
//                 builder: (controller) =>
//                     HandlingDataView(
//                   statusRequest:controller. statusRequest_lateness,
//                   widget: Lateness(//controller.details_lateness),
//                      allCount :controller.details_lateness.first.allCount,
//                      UnexcusedCount:controller.details_lateness.first.unexcusedCount,
//                      excusedCount:controller.details_lateness.first.excusedCount,
//                    //  days:controller.details_lateness.first.days
//                 ))),
//           ]),
//         ),
//       ),
//     );
//   }
// }
