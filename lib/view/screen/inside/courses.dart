import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/Inside_Controller/Courses_Contoller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/alertexitapp.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(Courses_Controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,

        title:
        Text(
          "مدرسة الأهلية الوطنية",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
       // actions: <Widget>[
        //  IconButton(icon: Icon(Icons.arrow_forward_sharp), onPressed: () {
        //    Get.offAllNamed(AppRoutes.Home);
    //      })
      //  ],


      ),
      // body: WillPopScope(
      //onWillPop: alertExitApp,  ),
      //child:
      body:GetBuilder<Courses_Controller>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 13, right: 8, left: 8),
                    child: Column(children: [
                      // CustomCardpermanence(
                      //     image: controller.details[0].img,
                      //     fName: controller.details[0].fname,
                      //     lName: controller.details[0].lname),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // CustomDetailspermanence(
                      //     desc: controller.details[0].mdesc,
                      //     subject: controller.details[0].mname),
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.gesture,
                          color: AppColor.secondColor,
                        ),
                        onPressed: () {
                          Get.toNamed(AppRoutes.student);
                        },
                        label: Text(
                          "40".tr,
                          style: const TextStyle(
                            fontSize: 16,
                            color: AppColor.secondColor,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.thirdColor,
                          fixedSize: const Size(210, 45),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        // thickness of the line
                        indent: 100,
                        // empty space to the leading edge of divider.
                        endIndent: 100,
                        // empty space to the trailing edge of the divider.
                        color: AppColor.secondColor,
                        // The color to use when painting the line.
                        height: 17, // The divider's height extent.
                      ),
                    ]),
                  );
                }),
          )),

    );
  }
}
// Padding(
// padding: const EdgeInsets.all(10.0),
// child: Row(
// children: [
// Icon(
// (Icons.description),
// color: AppColor.blue_splash,
// size: 33,
// ),
// Text(
// '42'.tr,
// style: TextStyle(
// color: AppColor.blue_splash,
// fontSize: 20),
// ),
// ],
// ),
//
// ),
// Padding(
// padding: const EdgeInsets.all(12.0),
// child: Text(
// controller.ditils.elementAt(0).mdesc,
// style: const TextStyle(
// color: Colors.black, fontSize: 17),
// ),
// ),
