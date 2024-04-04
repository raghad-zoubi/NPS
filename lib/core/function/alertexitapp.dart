import 'dart:io';
import 'package:nps/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/Home_Contoller.dart';
import '../constant/routes.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
      middleText: "هل تريد الخروج من التطبيق",

      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              exit(0);
            },
            child:const Text("تاكيد")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child:const Text("الغاء"))
      ]);
  return Future.value(true);
}
Future<bool> alertgoutApp() {
  Get.defaultDialog(
      title: "تنبيه",
      titleStyle:const  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
      middleText: "هل تريد تسجيل الخروج ",
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: ()    async {
              print("logout");
              SharedPreferences preferences = await SharedPreferences.getInstance();
              await preferences.clear();
              Get.offAllNamed(AppRoutes.login);

            },
            child:const Text("تاكيد")),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all(AppColor.primaryColor)),
            onPressed: () {
              Get.back();
            },
            child:const Text("الغاء"))
      ]);
  return Future.value(true);
}

Future<bool> alertreportApp() {
  var controller = Get.put(Home_Controller());
  Get.bottomSheet(

    StatefulBuilder(
      builder: (context, setState) {
        return



          GetBuilder<Home_Controller>(
              builder: (controller) =>    Center(
              child: Container(
                  height: MediaQuery.of(context).size.height/3.5,
                padding: EdgeInsets.all( 20.0),
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.blue, width:3.0),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.white,
                  ),

//
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [             Expanded(child:
                    ListView(

                      children: <Widget>[


                        TextFormField(
                          controller: controller.reportController,
                          // validator: (v) {
                          //   return controller.validateEmail(v!);
                          // },
                          onSaved: (v) {
                            controller.report = v!;
                          },
                          decoration: const InputDecoration(
                            helperText:  ' ادخل ما يزعجك او ما تتمنى ان يتحسن داخل مدرستنا',
                            labelText:'اكتب هنا',
                          ),
                          maxLines: 3,

                     //     textEditingController: controller.password,
                        ),
                        SizedBox(height: 7,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [


                            ElevatedButton(
                                   style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(AppColor.primaryColor)),
                                    onPressed: ()    async {
                                  controller.send_report();
                                  Get.back();

                                },
                                child: Text("    ارسال   ")
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(AppColor.primaryColor)),
                                onPressed: () {
                                  Get.back();
                                },
                                child:const Text("    الغاء   ")),

                          ],)


                      ],
                    ),),],)
//                 Center(child:      )


              )
          ));
      },
    ),
  );


  return Future.value(true);
}
