import 'package:flutter/material.dart%20';
import 'package:nps/core/class/handlingdataview.dart';
import 'package:nps/core/class/statusrequest.dart';

import '../../PermanenceFolder/mod_folder/In_Permanence_Model.dart';
import '../constant/color.dart';
import 'dart:math';
final List<Map> _products = List.generate(30, (i) {
  return {
    "id": i,
    "dfdf": "Product $i",
    "name": "Product $i",
    "price": Random().nextInt(200) + 1
  };
});
Future df(context, var iAm,Color color1, List<InPermanenceModel> details_absence_excused,
    StatusRequest statusRequest_absence_Excused){
  // فصل يوم تاريخ  شخص  مده  سبب
  //سبب visible1
  //مده visible2
  //شخص visible3
  double n=3;
  bool visible1=false,visible2=false,visible3=false;
  if (iAm=="1a" ){visible1=true;n=2.3;}
  if (iAm=="1l" ){visible1=true;visible2=true;n=2.3 ;}
  if (iAm=="2l" ){visible2=true;}
  if (iAm=="1p" ){visible3=true;n=2.3;}
  return
    showModalBottomSheet(
      context: context,

      isScrollControlled: true,

      builder: (BuildContext bc){
        return

          Container(
            height: MediaQuery.of(context).size.height * 1/n,


            padding: EdgeInsets.all(22),
            width: double.infinity,

            child: SingleChildScrollView(
              child:
        HandlingDataRequest(
        statusRequest: statusRequest_absence_Excused,
        widget:
              DataTable(

                //dividerThickness: 2,


                decoration: BoxDecoration(
                  border:Border(
                      right: Divider.createBorderSide(context, width: 2.0),
                      left: Divider.createBorderSide(context, width: 2.0)
                  ),
                  color: Colors.white30,
                ),
                showBottomBorder: true,
                columnSpacing:7,
                sortColumnIndex: 0,
                sortAscending: true,

                headingRowColor: MaterialStateProperty.all(color1),
                columns:  <DataColumn> [


                  DataColumn(label: Text(' الفصل ',style: TextStyle(color: AppColor.white))),
                  DataColumn(label: Text(' اليوم ',style: TextStyle(color: AppColor.white))),
                  DataColumn(label: Text(' التاريخ ',style: TextStyle(color: AppColor.white))),
                  DataColumn(    label: Visibility(
                      visible: visible1,
                      child :Text('السبب ',style: TextStyle(color: AppColor.white),)
                  ),),
                  DataColumn(   label: Visibility(
                      visible: visible2,
                      child : Text(' المدة ',style: TextStyle(color: AppColor.white)))),
                  DataColumn(   label: Visibility(
                      visible: visible3,
                      child : Text('المستأذن ',style: TextStyle(color: AppColor.white)))),
                ],

                rows: details_absence_excused.map((item) {
                  return
                    DataRow(
                        cells: [
                          DataCell(Text(item.semester,style:TextStyle(color: Colors.black))),
                          DataCell(Text(item.day,style:TextStyle(color: Colors.black))),
                          DataCell(Text(item.date.toString(),style:TextStyle(color: Colors.black))),
                          DataCell( Visibility(
                              visible: visible1,
                              child :Text(item.reason.toString(),style:TextStyle(color: Colors.black)))),
                          DataCell( Visibility(
                              visible: visible2,
                              child :Text(item.time.toString(),style:TextStyle(color: Colors.black)))),

                          DataCell( Visibility(
                              visible: visible3,
                              child :Text(item.person.toString(),style:TextStyle(color: Colors.black)))),

                          // DataCell(Text(item['id'].toString(),style:TextStyle(color: Colors.black) + 'op')),

                        ]);
                }).toList(),
              ),
            )),
          ) ;
      }
  );
}