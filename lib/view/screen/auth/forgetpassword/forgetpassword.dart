// import 'package:nps/controller/auth/forgetpassword/forgetpassword_controller.dart';
// import 'package:nps/core/class/handlingdataview.dart';
// import 'package:nps/core/class/statusrequest.dart';
// import 'package:nps/core/constant/color.dart';
// import 'package:nps/view/widjet/auth/custombodyauth.dart';
// import 'package:nps/view/widjet/auth/custombuttomauth.dart';
// import 'package:nps/view/widjet/auth/customtextformauth.dart';
// import 'package:nps/view/widjet/auth/customtittleauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ForgetPassword extends StatelessWidget {
//   const ForgetPassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ForgetPasswordControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: AppColor.backgroundcolor,
//         elevation: 0.0,
//         title: Text('14'.tr,
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: GetBuilder<ForgetPasswordControllerImp>(
//           builder: (controller) => HandlingDataRequest(
//           statusRequest: controller.statusRequest,
//     widget:Container(
//       padding:
//       const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//       child: Form(
//         key: controller.formstate,
//         child: ListView(children: [
//           const SizedBox(height: 20),
//           CustomTittleAuth(tittle: "27".tr),
//           const SizedBox(height: 10),
//           CustomBodyAuth(
//             // please Enter Your Email Address To Recive A verification code
//               body: "29".tr),
//           const SizedBox(height: 15),
//           CustomTextFormAuth(
//             isNumber: false,
//             validator: (val) {},
//             textEditingController: controller.email,
//             hint: "12".tr,
//             icon: const Icon(Icons.email_outlined),
//             label: "18".tr,
//             // mycontroller: ,
//           ),
//           CustomButtonAuth(
//               text: "30".tr,
//               onPressed: () {
//                 controller.checkemail();
//               }),
//           const SizedBox(height: 40),
//         ]),
//       ),
//     ))
//           ),
//     );
//   }
// }
