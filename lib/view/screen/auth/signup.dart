// import 'package:nps/controller/auth/signup_controller.dart';
// import 'package:nps/core/class/handlingdataview.dart';
// import 'package:nps/core/constant/color.dart';
// import 'package:nps/core/function/alertexitapp.dart';
// import 'package:nps/core/function/validinput.dart';
// import 'package:nps/view/widjet/auth/custombodyauth.dart';
// import 'package:nps/view/widjet/auth/custombuttomauth.dart';
// import 'package:nps/view/widjet/auth/customtextformauth.dart';
// import 'package:nps/view/widjet/auth/customtextsignupOrsignIn.dart';
// import 'package:nps/view/widjet/auth/customtittleauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class SignIn extends StatelessWidget {
//   const SignIn({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     //  SignUpControllerImp controller = Get.put(SignUpControllerImp());
//     //  SignUpControllerImp controller = Get.find();
//     //Get.lazyPut(() => SignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColor.backgroundcolor,
//         title: Text("17".tr,
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//         elevation: 0.0,
//
//       ),
//       body: WillPopScope(
//           onWillPop: alertExitApp,
//           child: GetBuilder<SignUpControllerImp>(
//             builder: (controller) => HandlingDataRequest(
//               statusRequest: controller.statusRequest,
//               widget: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                 child: Form(
//                   key: controller.formstate,
//                   child: ListView(
//                     children: [
//                       const SizedBox(height: 20),
//                       //  const CustomLogoAuth(),
//                       CustomTittleAuth(tittle: "10".tr),
//                       const SizedBox(
//                         height: 25,
//                       ),
//                       CustomBodyAuth(body: "24".tr),
//                       const SizedBox(height: 30),
//                       CustomTextFormAuth(
//                         validator: (val) {
//                           return validInput(val!, 3, 20, "username");
//                         },
//                         isNumber: false,
//                         hint: "23".tr,
//                         icon: const Icon(Icons.person_outline),
//                         label: "20".tr,
//                         textEditingController: controller.name,
//                       ),
//                       const SizedBox(height: 15),
//                       CustomTextFormAuth(
//                         isNumber: false,
//                         validator: (val) {
//                           print(val);
//                           return validInput(val!, 3, 40, "email");
//                         },
//                         hint: "12".tr,
//                         icon: const Icon(Icons.email_outlined),
//                         label: "18".tr,
//                         textEditingController: controller.email,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       CustomTextFormAuth(
//                         isNumber: true,
//                         validator: (val) {
//                           return validInput(val!, 7, 11, "phone");
//                         },
//                         hint: "22".tr,
//                         icon: const Icon(Icons.phone_android_outlined),
//                         label: "21".tr,
//                         textEditingController: controller.phone,
//                       ),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       CustomTextFormAuth(
//                         isNumber: false,
//                         validator: (val) {
//                           return validInput(val!, 3, 30, "password");
//                         },
//                         hint: "13".tr,
//                         icon: const Icon(Icons.lock_outlined),
//                         label: "19".tr,
//                         textEditingController: controller.password,
//                       ),
//
//                       CustomButtonAuth(
//                           text: "17".tr,
//                           onPressed: () {
//                             controller.signUp();
//                           }),
//                       const SizedBox(height: 40),
//                       CustomTextSignUpOrSignIn(
//                         textone: "16".tr,
//                         texttwo: "26".tr,
//                         onTap: () {
//                           controller.goToSignIn();
//                         },
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }
