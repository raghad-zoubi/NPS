
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../Noti/SingltoneNotification.dart';
import '../../../controller/Inside_Controller/Grades_Contoller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imgaeasset.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/onboarding.dart';
import '../../widjet/dateRange.dart';



class Grades extends StatelessWidget {
 bool valshow=false;




  @override
  Widget build(BuildContext context) {
  Get.put(Grades_Controller());
  //Get.put(SingltoneNotification1());

    return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,

            title:
            Text(
              "مدرسة الأهلية الوطنية",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // actions: <Widget>[
            //   IconButton(icon: Icon(Icons.arrow_forward_sharp), onPressed: () {
            //     Get.offAllNamed(AppRoutes.Home);
            //   })
            // ],
            //

          ),
        body:
        GetBuilder<Grades_Controller>(
        builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest_subject,

    widget:


Column(children: [
  drop1(context,controller),
  Center(
  child: ElevatedButton(

    style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.white, // background (button) color
        foregroundColor: AppColor.black,
        side: BorderSide(
            width: 2,
            color: AppColor.orang11),
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
              20,
            ))),
    onPressed: () {

      showDialog(
          context: context,useSafeArea: true,

          builder: (context) {


            return
            Center(child: Stack (children: [
              dataRange(context,controller),
              ElevatedButton(
                  child:Text(' ارسال ') ,
                  onPressed: () {
                    Navigator.of(context).pop(true);
                   bool h= controller.value_range();
                    print(h);
                    valshow=h;
                  //  if()
                 controller. show_info_grade();
                  } )],),)  ;

          });

    },
    child: Text('  اختر الفترة  '),
  ),


),
          Visibility(
            visible:valshow,child:


      Center(child:
      ListView(   shrinkWrap: true,scrollDirection: Axis.vertical,children: [tableGrades(context,controller)],

      )
      ),)
],) ,











        ))
    );
  }
}

Stack drop1(BuildContext context,Grades_Controller controller){
  return Stack(
    children: <Widget>[
      dropdown1(context,controller),
      Positioned(
        left: 50,
        top: 12,
        child: Container(
          //    padding: EdgeInsets.only(bottom: 0, left: 10, right: 10),
          color: AppColor.white,
          child: Text(
            'المواد الدراسيّة',

            style: const TextStyle(
              // fontWeight: FontWeight.w700,
              color: AppColor.blue_splash,
            ),
          ),
        ),),
    ],
  );
}

Container dropdown1(BuildContext context,Grades_Controller controller){

  return   Container(
    // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    // width: 300,
    width: MediaQuery.of(context).size.width/1.3,
    height: MediaQuery.of(context).size.height/13,
    margin: EdgeInsets.fromLTRB(40, 34, 20, 23),
    padding: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      border: Border.all(

          color: AppColor.orang11, width: 3),
      borderRadius: BorderRadius.circular(5),
      shape: BoxShape.rectangle,
    ),
    child:
    DropdownButton<String>(
      value: controller.selectedValue1,

      onChanged: (newValue) {
        controller.onSelected1(newValue!);
      },
      hint:
      const Center(
          child: Text(
            'اختر المادة',
            style: TextStyle( color:AppColor.black,fontSize: 18),
          )),
      // Hide the default underline
      underline: Container(),
      // set the color of the dropdown menu
      dropdownColor: AppColor.white,
      // icon: const Icon(
      //   Icons.arrow_downward,
      //   color: Colors.yellow,
      // ),
      isExpanded: true,

      items: controller.det .map((e) =>
          DropdownMenuItem(
            value: e,
            child: Container(

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                shape: BoxShape.rectangle,
              ),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 10,right: 10,left: 10),
              child: Text(
                "${e}",
                style: const TextStyle( color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,),
              ),
            ),
          ))
          .toList(),






      selectedItemBuilder: (BuildContext context) => controller.det
          .map((e) => Center(
        child: Text(
          "${e}",
          style: const TextStyle(
              fontSize: 18,
              color: Colors.amber,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ))
          .toList(),
    ),
  );
}

//_____________
Container dataRange(BuildContext context,Grades_Controller controller){
  return

    Container(
        height: MediaQuery.of(context).size.height/2.3,
      color: Colors.white,
              margin: EdgeInsets.all(9),
              child:
                Padding(padding: EdgeInsets.only(top: 45),

                  child: SfDateRangePicker(

                    // rangeSelectionColor: AppColor.orang1 ,
                    // endRangeSelectionColor:AppColor.orang11  ,
                    //
                    // startRangeSelectionColor:AppColor.orang11  ,

                    onSelectionChanged:controller.onSelectionChanged,
                    selectionMode: DateRangePickerSelectionMode.range,
                    initialSelectedRange: PickerDateRange(

                        DateTime.now(),
                        DateTime.now()
                    ),
                  ),
                )

            );
}
//______________
SingleChildScrollView tableGrades(BuildContext context, Grades_Controller controller ){

 return

   SingleChildScrollView(
scrollDirection:Axis.horizontal ,
      child:

     HandlingDataView(
         statusRequest: controller.statusRequest_grades, widget:

      Container(

  height: MediaQuery.of(context).size.height/1.5,
          child:
  Column(children: <Widget>[


  Expanded(
  flex: 1,
  child:
  ListView(
      shrinkWrap: true,scrollDirection: Axis.horizontal,
      children: [
  Column(children: [
  Container(
  padding: const EdgeInsets.only(
  top: 12, right: 0, left: 0, bottom: 0),
  margin: const EdgeInsets.only(
  top: 12, right: 0, left: 0, bottom: 22),
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height /1.6,
  child:
    //  Text('opo')
  ListView.builder(
    shrinkWrap: true,
  scrollDirection: Axis.vertical,
  itemCount: 1,
  itemBuilder: (context, index) {

  return
//   Column(
//   children: [
//     Text('opoggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg')
// ])






      DataTable(

        //dividerThickness: 2,
        horizontalMargin: 6,
        dividerThickness: 3,
        decoration: BoxDecoration(
          border:Border(
              right: Divider.createBorderSide(context, width: 2.0),
              left: Divider.createBorderSide(context, width: 2.0)
          ),
          color: Colors.white30,
        ),
        showBottomBorder: true,
        columnSpacing:8,
        sortColumnIndex: 0,dataRowHeight: 70,
        sortAscending: true,

        headingRowColor: MaterialStateProperty.all(AppColor.orang11),
        columns:  <DataColumn> [



          DataColumn(label: Text( "  النوع",style:TextStyle(color:AppColor.white,  fontSize: 18.0,
            fontWeight: FontWeight.normal,))),
          DataColumn(label:Text('الدرجة',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
            fontWeight: FontWeight.normal,))),
          DataColumn(label:Text(' العظمى ',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
            fontWeight: FontWeight.normal,),
            overflow: TextOverflow.ellipsis
            ,softWrap: true,)),
          DataColumn(label:Visibility(
              visible:true,
              child:Text(' الدنيا',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
                fontWeight: FontWeight.normal,),
                overflow: TextOverflow.ellipsis
                ,softWrap: true,)
          ),),
          DataColumn(label:Text('التاريخ',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
            fontWeight: FontWeight.normal,))),
          DataColumn(label:Text('الفصل',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
            fontWeight: FontWeight.normal,))),


        ],

        rows: controller.details_grades.map((item) {
          return
            DataRow(
                cells: [  DataCell(Text(item.name.toString() ,style: TextStyle(color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w300,
                    fontStyle: FontStyle.normal))),
                  DataCell(Text(item.studentMark.toString() ,style: TextStyle(color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal))),
                  DataCell(Text(item.highMark .toString(),style: TextStyle(color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal))),

                  //
                  DataCell( Visibility(
                      visible: true,
                      child :Text(item.lowMark.toString() .toString(),style: TextStyle(color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.normal
                      )))),
                  DataCell(Text(item.date .toString(),style: TextStyle(color: Colors.black,
                      fontSize: 18.0,  fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal
                  ))),
                  DataCell(Text(item.semester.toString()  ,style: TextStyle(color: Colors.black,
                      fontSize: 18.0,  fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal
                  ))),

                  // DataCell(Text(item['id'].toString() + 'op')),

                ]);
        }).toList(),
      );











  ;})



  )

  ]),]))]))

  )
)
  ;




//     Container(
//             height: 300,
//             //MediaQuery.of(context).size.height/1.6 ,
//
//
//             padding: EdgeInsets.only(top: 22,right: 22,left: 22),
//             width: double.infinity,
//
//             child:
//
//             ListView(  scrollDirection: Axis.vertical, children: [
//             //SingleChildScrollView(
//
//             //  child:
//       HandlingDataView(
//         statusRequest: controller.statusRequest_grades, widget:
//
//               DataTable(
//
//                 //dividerThickness: 2,
// horizontalMargin: 6,
// dividerThickness: 3,
//                 decoration: BoxDecoration(
//                   border:Border(
//                       right: Divider.createBorderSide(context, width: 2.0),
//                       left: Divider.createBorderSide(context, width: 2.0)
//                   ),
//                   color: Colors.white30,
//                 ),
//                 showBottomBorder: true,
//                 columnSpacing:8,
//                 sortColumnIndex: 0,dataRowHeight: 70,
//                 sortAscending: true,
//
//                 headingRowColor: MaterialStateProperty.all(AppColor.orang11),
//                 columns:  <DataColumn> [
//
//
//
//                   DataColumn(label: Text( "النوع",style:TextStyle(color:AppColor.white,  fontSize: 18.0,
//                     fontWeight: FontWeight.normal,))),
//                   DataColumn(label:Text('الدرجة',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
//                     fontWeight: FontWeight.normal,))),
//                   DataColumn(label:Text(' العلامةالعظمى ',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
//                     fontWeight: FontWeight.normal,),
//                     overflow: TextOverflow.ellipsis
//                     ,softWrap: true,)),
//                   DataColumn(label:Visibility(
//                       visible:true,
//                       child:Text('الدنيا',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
//                         fontWeight: FontWeight.normal,),
//                         overflow: TextOverflow.ellipsis
//                         ,softWrap: true,)
//                   ),),
//                   DataColumn(label:Text('التاريخ',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
//                     fontWeight: FontWeight.normal,))),
//                   DataColumn(label:Text(' الفصل',style:TextStyle(color:AppColor.white,  fontSize: 18.0,
//                     fontWeight: FontWeight.normal,))),
//
//
//                 ],
//
//                 rows: controller.details_grades.map((item) {
//                   return
//                     DataRow(
//                         cells: [  DataCell(Text(item.name.toString() ,style: TextStyle(color: Colors.black,
//                           fontSize: 18.0,
//                           fontWeight: FontWeight.w300,
//                         fontStyle: FontStyle.normal))),
//                           DataCell(Text(item.studentMark.toString() ,style: TextStyle(color: Colors.black,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300,
//                         fontStyle: FontStyle.normal))),
//                           DataCell(Text(item.highMark .toString(),style: TextStyle(color: Colors.black,
//                             fontSize: 18.0,
//                             fontWeight: FontWeight.w300,
//                         fontStyle: FontStyle.normal))),
//
//                         //
//                           DataCell( Visibility(
//                               visible: true,
//                               child :Text(item.lowMark.toString() .toString(),style: TextStyle(color: Colors.black,
//                                 fontSize: 18.0,
//                                   fontWeight: FontWeight.w300,
//                                   fontStyle: FontStyle.normal
//                                 )))),
//                           DataCell(Text(item.date .toString(),style: TextStyle(color: Colors.black,
//                             fontSize: 18.0,  fontWeight: FontWeight.w300,
//                               fontStyle: FontStyle.normal
//                             ))),
//                           DataCell(Text(item.semester.toString()  ,style: TextStyle(color: Colors.black,
//                             fontSize: 18.0,  fontWeight: FontWeight.w300,
//                               fontStyle: FontStyle.normal
//                             ))),
//
//                           // DataCell(Text(item['id'].toString() + 'op')),
//
//                         ]);
//                 }).toList(),
//               )),
//   ])
//             )

  ;

}