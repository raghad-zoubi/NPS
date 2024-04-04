// import 'package:flutter/material.dart';
//
// class CustomAppBar extends StatelessWidget {
//   final void Function()? onPressIconNotification;
//   final void Function()? onPressIconSearch;
//   final String ? titleappbar;
//
//   const CustomAppBar(
//       {required this.titleappbar,required this.onPressIconNotification, required this.onPressIconSearch ,Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextFormField(
//               decoration: InputDecoration(
//                 hintText: titleappbar,
//                 prefixIcon: IconButton(
//                   icon: const Icon(Icons.search_rounded),
//                   onPressed: onPressIconSearch,),
//                 fillColor: Colors.grey[200],
//                 filled: true,
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//             ),
//           ),
//           const SizedBox(
//             width: 10,
//           ),
//           Container(
//             height: 60,
//             decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10)),
//             child: IconButton(
//               iconSize: 30,
//               // padding:EdgeInsets.all(10) ,
//               onPressed: onPressIconNotification,
//               icon: const Icon(Icons.notifications_active_outlined),
//               color: Colors.grey[600],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
