// import 'package:nps/controller/auth/verfiycodesignup_controller.dart';
// import 'package:nps/core/class/handlingdataview.dart';
// import 'package:nps/core/class/statusrequest.dart';
// import 'package:nps/core/constant/color.dart';
// import 'package:nps/view/widjet/auth/custombodyauth.dart';
// import 'package:nps/view/widjet/auth/customtittleauth.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';
//
// class VerfiyCodeSignUp extends StatelessWidget {
//   const VerfiyCodeSignUp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // VerifyCodeSignUpControllerImp controller =
//     Get.put(VerifyCodeSignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: AppColor.backgroundcolor,
//         elevation: 0.0,
//         title: Text('Verification Code',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: GetBuilder<VerifyCodeSignUpControllerImp>(
//           builder: (controller) => HandlingDataRequest(
//                 statusRequest: controller.statusRequest,
//                 widget: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                   child: ListView(children: [
//                     const SizedBox(height: 20),
//                     const CustomTittleAuth(tittle: "Check code"),
//                     const SizedBox(height: 10),
//                     const CustomBodyAuth(
//                         body:
//                             "Please Enter The Digit Code Sent To wael@gmail.com"),
//                     const SizedBox(height: 15),
//                     OtpTextField(
//                       fieldWidth: 50.0,
//                       borderRadius: BorderRadius.circular(20),
//                       numberOfFields: 5,
//                       borderColor: const Color(0xFF512DA8),
//                       //set to true to show as box or false to show as dash
//                       showFieldAsBox: true,
//                       //runs when a code is typed in
//                       onCodeChanged: (String code) {
//                         //handle validation or checks here
//                       },
//                       //runs when every textfield is filled
//                       onSubmit: (String verificationCode) {
//                         controller.goToSuccessSignUp(verificationCode);
//                       }, // end onSubmit
//                     ),
//                     const SizedBox(height: 40),
//                   ]),
//                 ),
//               )),
//     );
//   }
// }
