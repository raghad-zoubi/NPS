// import 'package:nps/core/class/statusrequest.dart';
// import 'package:nps/core/constant/imgaeasset.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// import '../../controller/Home_Contoller.dart';
//
// class HandlingDataView extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//
//   const HandlingDataView(
//       {Key? key, required this.statusRequest, required this.widget})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
//         : statusRequest == StatusRequest.offlinefailure
//             ? Center(
//                 child: Lottie.asset(AppImageAsset.offline,
//                     width: 250, height: 250))
//             : statusRequest == StatusRequest.serverfailure
//                 ? Center(
//                     child: Lottie.asset(AppImageAsset.server,
//                         width: 250, height: 250))
//                 //:
//     // statusRequest == StatusRequest.noData
//     //                 ? Center(
//     //                     child: Lottie.asset(AppImageAsset.outTime,
//     //                         width: 250, height: 250, repeat: true))
//     //                 :
//     // statusRequest == StatusRequest.outTime
//     //                 ? Center(
//     //                     child: Lottie.asset(AppImageAsset.outTime,
//     //                         width: 250, height: 250, repeat: true))
//                     : widget;
//   }
// }
//
// class HandlingDataRequest extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//
//   const HandlingDataRequest(
//       {Key? key, required this.statusRequest, required this.widget})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
//         : statusRequest == StatusRequest.offlinefailure
//             ? Center(
//                 child: Lottie.asset(AppImageAsset.offline,
//                     width: 250, height: 250))
//             : statusRequest == StatusRequest.serverfailure
//                 ? Center(
//                     child: Lottie.asset(AppImageAsset.server,
//                         width: 250, height: 250))
//                 : widget;
//   }
// }
//
// class HandlingDataRequestWithRefresh extends StatelessWidget {
//   final StatusRequest statusRequest;
//   final Widget widget;
//   final Home_Controller controller;
//
//   const HandlingDataRequestWithRefresh(
//       {Key? key,
//       required this.statusRequest,
//       required this.widget,
//       required this.controller})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return statusRequest == StatusRequest.loading
//         ? Center(
//             child: Lottie.asset(AppImageAsset.loading, width: 250, height: 250))
//         : statusRequest == StatusRequest.offlinefailure
//             ? RefreshIndicator(
//                 onRefresh: controller.onRefresh,
//                 child: Center(
//                     child: Lottie.asset(AppImageAsset.offline,
//                         width: 250, height: 250)),
//               )
//             : statusRequest == StatusRequest.serverfailure
//                 ? RefreshIndicator(
//                     onRefresh: controller.onRefresh,
//                     child: Center(
//                         child: Lottie.asset(AppImageAsset.server,
//                             width: 250, height: 250)),
//                   )
//                 : RefreshIndicator(
//                     onRefresh: controller.onRefresh, child: widget);
//   }
// }
