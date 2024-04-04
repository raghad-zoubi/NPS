import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


// class dataRange_Controller extends GetxController {
//   List<String> det=[] ;
//   String? _selectedDate ;
//   String? _dateCount ;
//   String? _range ;
//   String? _rangeCount ;
//
//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//
//     if (args.value is PickerDateRange) {
//       _range = '${DateFormat('dd/MM/yyyy').format(args.value.startDate)} -'
//       // ignore: lines_longer_than_80_chars
//           ' ${DateFormat('dd/MM/yyyy').format(args.value.endDate ?? args.value.startDate)}';
//     } else if (args.value is DateTime) {
//       _selectedDate = args.value.toString();
//     } else if (args.value is List<DateTime>) {
//       _dateCount = args.value.length.toString();
//     } else {
//       _rangeCount = args.value.length.toString();
//
//
//     }
//
//
//     void onInit() {
//
//       super.onInit();
//     }
//
//     Future<void> onRefresh() async {
//
//       update();
//     }
//
//   }
// }
//
//
// /// State for dataRange
// class dataRange extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(dataRange_Controller());
//     return
//
//
//                MaterialApp(
//                       home: Scaffold(
//                           appBar: AppBar(
//                             title: const Text('DatePicker demo'),
//                           ),
//                           body:
//
//                           GetBuilder<dataRange_Controller>(
//     builder: (controller) {
//     return
//       Stack(
//                             children: <Widget>[
//                               Positioned(
//                                 left: 0,
//                                 right: 0,
//                                 top: 0,
//                                 height: 80,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                   mainAxisSize: MainAxisSize.min,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text('Selected date: ${controller._selectedDate}'),
//                                     Text('Selected date count: ${controller._dateCount}'),
//                                     Text('Selected range: ${controller._range}'),
//                                     Text('Selected ranges count: ${controller._rangeCount}')
//                                   ],
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 0,
//                                 top: 80,
//                                 right: 0,
//                                 bottom: 0,
//                                 child: SfDateRangePicker(allowViewNavigation: true,
//                                   onSelectionChanged:controller. _onSelectionChanged,
//                                   selectionMode: DateRangePickerSelectionMode.range,
//                                   initialSelectedRange: PickerDateRange(
//                                       DateTime.now().subtract(const Duration(days: 4)),
//                                       DateTime.now().add(const Duration(days: 3))),
//                                 ),
//                               )
//                             ],
//                           );})));
//
//   }
// }
//
