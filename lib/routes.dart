
import 'package:nps/core/constant/routes.dart';
import 'package:nps/core/middlewares/mymiddlewar.dart';
import 'package:nps/file_courses/course.dart';
import 'package:nps/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:nps/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:nps/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:nps/view/screen/auth/login.dart';
import 'package:nps/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:nps/view/screen/auth/signup.dart';
import 'package:nps/view/screen/auth/success_signup.dart';
import 'package:nps/view/screen/auth/verifycodesignup.dart';
import 'package:nps/view/screen/inside/budgets.dart';
import 'package:nps/view/screen/inside/courses.dart';
import 'package:nps/view/screen/inside/grades.dart';
import 'package:nps/file_ads/ads.dart';
import 'package:nps/view/screen/inside/notes.dart';
import 'package:nps/view/screen/inside/program.dart';
//import 'package:nps/view/screen/languge.dart';
import 'package:nps/view/screen/onboarding.dart';
import 'package:nps/view/screen/Home.dart';
//import 'package:nps/view/screen/students.dart';
import 'package:get/get.dart';
import 'package:open_file_plus/open_file_plus.dart';


import 'PermanenceFolder/sc_folder/permanence.dart';


List<GetPage<dynamic>>? routes=[
  GetPage(name: "/", page:()=> const LogIn(),middlewares: [MyMiddleWare()]),
//GetPage(name: "/", page:()=>  TestView()),

//======================auth================================
GetPage(name: AppRoutes.login, page:()=> const LogIn()),
// GetPage(name: AppRoutes.signUp, page:()=> const SignIn()),
//  GetPage(name: AppRoutes.forgetPassword, page:()=>const  ForgetPassword()),
//  GetPage(name: AppRoutes.verfiyCode, page:()=>const  VerfiyCode()),
//  GetPage(name: AppRoutes.resetPassword, page:()=>const  ResetPassword()),
//  GetPage(name: AppRoutes.verfiyCodeSignUp, page:()=>const  VerfiyCodeSignUp()),
//  GetPage(name: AppRoutes.successResetpassword, page:()=>const  SuccessResetPassword()),
//  GetPage(name: AppRoutes.successSignUp, page:()=> const SuccessSignUp()),
 GetPage(name: AppRoutes.onBoarding, page:()=>  OnBoarding()),


  //===========================================
  GetPage(name:AppRoutes.Home,page:()=> Home() ),
  //GetPage(name:AppRoutes.student ,page:()=> students() ),

  GetPage(name:AppRoutes.courses ,page:()=> FileListc() ),
  GetPage(name:AppRoutes.notes ,page:()=> Notes() ),
  GetPage(name:AppRoutes.ads ,page:()=> Ads() ),
  GetPage(name:AppRoutes.permanence ,page:()=> permanence() ),
// GetPage(name:AppRoutes.permanence ,page:()=> permanenceScreen() ),
  GetPage(name:AppRoutes.Budgets ,page:()=> Budgets() ),
  GetPage(name:AppRoutes.program ,page:()=> Program() ),
  GetPage(name:AppRoutes.grades ,page:()=> Grades() ),


];









//
// Map<String, Widget Function(BuildContext)> routes = {
//   AppRoutes.login: (context) =>  LogIn(),
//   AppRoutes.signUp: (context) =>   SignIn(),
//   AppRoutes.forgetPassword:(context)=> ForgetPassword(),
//   AppRoutes.verfiyCode:(context)=> VerfiyCode(),
//   AppRoutes.resetPassword:(context)=> ResetPassword(),
//   AppRoutes.verfiyCodeSignUp: (context) =>  VerfiyCodeSignUp(),
//   AppRoutes.successResetpassword: (context) =>  SuccessResetPassword(),
//   AppRoutes.successSignUp: (context) =>  SuccessSignUp(),
//   AppRoutes.onBoarding: (context) =>  OnBoarding(),
// };

//
// Container(
//  padding: EdgeInsets.only(top:10),
//   margin:
//   const EdgeInsets.only(top: 30, bottom: 10,left:20,right: 20),
//
//   width: MediaQuery.of(context).size.width /4,
//   height: MediaQuery.of(context).size.height / 13,
//
//   decoration: BoxDecoration(
//       border: Border.all(color: Colors.blueAccent,width: 2),
//       borderRadius: BorderRadius.all(Radius.circular(20))
//   ),
//   child: Center(
//     child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           new Image(
//             image: AssetImage(
//               // 'assets/images/logo.png'
//               //     'assets/images/notes.png'
//                 '${item.icon}'),
//             fit: BoxFit.contain,
//             width:
//             MediaQuery.of(context).size.width /
//                8,
//             height:
//             MediaQuery.of(context).size.height /
//                23,
//           ),
//
//           Center(
//             child: Text(
//               '${item.name}',
//               //Text( "$item.",
//               style: const TextStyle(
//                   fontWeight: FontWeight.normal),
//             ),
//             // '${item.BasicImage}'),
//           ),
//         ]),
//   ),
// ),