import 'package:nps/controller/auth/login_controller.dart';
import 'package:nps/core/class/handlingdataview.dart';
import 'package:nps/core/class/statusrequest.dart';
import 'package:nps/core/constant/color.dart';
import 'package:nps/core/function/alertexitapp.dart';
import 'package:nps/core/function/validinput.dart';
import 'package:nps/view/widjet/auth/custombodyauth.dart';
import 'package:nps/view/widjet/auth/custombuttomauth.dart';
import 'package:nps/view/widjet/auth/customlogoauth.dart';
import 'package:nps/view/widjet/auth/customtextformauth.dart';
import 'package:nps/view/widjet/auth/customtextsignupOrsignIn.dart';
import 'package:nps/view/widjet/auth/customtittleauth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.blue_splash,
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginController>(
              builder: (controller) => HandlingDataRequest(
                    statusRequest: controller.statusRequest,
                    widget: Container(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: controller.formstate,
                        child: ListView(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 50, left: 50),
                              child: CustomLogoAuth2(),
                            ),

                            CustomTittleAuth(tittle: "الرجاء ادخال كود الطالب"),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // CustomBodyAuth(body: "11".tr),
                            const SizedBox(height: 30),
                            CustomTextFormAuth(
                              isNumber: false,
                              validator: (val) {
                                return validInput(val!, 5, 100, "password");
                              },
                              hint: "كود الطالب",
                              icon: const Icon(Icons.qr_code_sharp),
                              label: "ادخل الكود",
                              textEditingController: controller.password,
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            // GetBuilder<LoginController>(
                            //     builder: (controller) => CustomTextFormAuth(
                            //           obscureText: controller.isShowPassword,
                            //           onTapIcon: () {
                            //             controller.changeShowPassword();
                            //           },
                            //           isNumber: false,
                            //           validator: (val) {
                            //             return validInput(val!, 5, 30, "password");
                            //           },
                            //           hint: "13".tr,
                            //           icon: const Icon(Icons.lock_outlined),
                            //           label: "19".tr,
                            //           textEditingController:
                            //               controller.password,
                            //         )),

                            InkWell(
                                child: Container(
                                    alignment: Alignment.bottomRight,
                                    margin: EdgeInsets.all(20),
                                    child: CircleAvatar(
                                      radius: 30.0,
                                      child: Icon(Icons.arrow_back,
                                          color: AppColor.blue_absance),
                                      backgroundColor: AppColor.white,
                                    )),
                                onTap: ()async {
                                  controller.login();

                                })

                            //const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ),
                  ))),
    );
  }
}
