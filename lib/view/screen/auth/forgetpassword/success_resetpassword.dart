// import 'package:nps/controller/auth/successresetpassword_controller.dart';
// import 'package:nps/core/constant/color.dart';
// import 'package:nps/view/widjet/auth/custombuttomauth.dart';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SuccessResetPassword extends StatelessWidget {
//   const SuccessResetPassword({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     SuccessResetPasswordControllerImp controller =
//         Get.put(SuccessResetPasswordControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: AppColor.backgroundcolor,
//         elevation: 0.0,
//         title: Text('Success',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(15),
//         child: Column(children: [
//           const Center(
//               child: Icon(
//             Icons.check_circle_outline,
//             size: 200,
//             color: AppColor.primaryColor,
//           )),
//           Text("37".tr,
//               style: Theme.of(context)
//                   .textTheme
//                   .headline1!
//                   .copyWith(fontSize: 30)),
//           Text("36".tr),
//           const Spacer(),
//           SizedBox(
//             width: double.infinity,
//             child: CustomButtonAuth(
//                 text: "31".tr,
//                 onPressed: () {
//                   controller.goToPageLogin();
//                 }),
//           ),
//         ]),
//       ),
//     );
//   }
// }
