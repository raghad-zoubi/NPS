// import 'package:nps/controller/auth/forgetpassword/forgetpassword_controller.dart';
// import 'package:nps/controller/auth/forgetpassword/resetpassword_controller.dart';
// import 'package:nps/core/class/handlingdataview.dart';
// import 'package:nps/core/class/statusrequest.dart';
// import 'package:nps/core/constant/color.dart';
// import 'package:nps/core/function/validinput.dart';
// import 'package:nps/view/widjet/auth/custombodyauth.dart';
// import 'package:nps/view/widjet/auth/custombuttomauth.dart';
// import 'package:nps/view/widjet/auth/customtextformauth.dart';
// import 'package:nps/view/widjet/auth/customtittleauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ResetPassword extends StatelessWidget {
//   const ResetPassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ResetPasswordControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: AppColor.backgroundcolor,
//         elevation: 0.0,
//         title: Text('ResetPassword',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: GetBuilder<ResetPasswordControllerImp>(
//           builder: (controller) => HandlingDataRequest(
//           statusRequest: controller.statusRequest,
//     widget:Container(
//       padding:
//       const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       child: Form(
//         key: controller.formstate,
//         child: ListView(children: [
//           const SizedBox(height: 20),
//           CustomTittleAuth(tittle: "35".tr),
//           const SizedBox(height: 10),
//           CustomBodyAuth(body: "35".tr),
//           const SizedBox(height: 15),
//           CustomTextFormAuth(
//             isNumber: false,
//             validator: (val) {
//               return validInput(val!, 3, 40, "password");
//             },
//             textEditingController: controller.password,
//             hint: "13".tr,
//             icon: const Icon(Icons.lock_outline),
//             label: "19".tr,
//             // mycontroller: ,
//           ),
//           CustomTextFormAuth(
//             isNumber: false,
//
//             validator: (val) {
//               return validInput(val!, 3, 40, "password");
//             },
//             textEditingController: controller.repassword,
//             hint: "Re" + " " + "13".tr,
//             icon: Icon(Icons.lock_outline),
//             label: "19".tr,
//             // mycontroller: ,
//           ),
//           CustomButtonAuth(
//               text: "33".tr,
//               onPressed: () {
//                 controller.goToSuccessResetPassword();
//               }),
//           const SizedBox(height: 40),
//         ]),
//       ),
//     ))
//           ),
//     );
//   }
// }
