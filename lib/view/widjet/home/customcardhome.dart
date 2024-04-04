// import 'package:nps/core/constant/color.dart';
// import 'package:flutter/material.dart';
//
// class CustomCardHome extends StatelessWidget {
//   final String title;
//   final String body;
//
//   const CustomCardHome({required this.title, required this.body, Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 15),
//       child: Stack(
//         children: [
//           Container(
//             alignment: Alignment.center,
//             height: 150,
//             decoration: BoxDecoration(
//                 color: AppColor.primaryColor,
//                 borderRadius: BorderRadius.circular(20)),
//             child: ListTile(
//               title: Text(
//                 title,
//                 style: const TextStyle(fontSize: 20, color: Colors.white),
//               ),
//               subtitle: Text(
//                 body,
//                 style: const TextStyle(fontSize: 30, color: Colors.white),
//               ),
//             ),
//           ),
//           Positioned(
//             top: -20,
//             right: -20,
//             child: Container(
//               height: 160,
//               width: 160,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(160),
//                 color: AppColor.secondColor,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
