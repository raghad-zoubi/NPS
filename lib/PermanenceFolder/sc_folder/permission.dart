import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:nps/PermanenceFolder/mod_folder/Permanence_Model.dart';

import '../../core/class/handlingdataview.dart';
import '../../core/function/_settingModalBottomSheet.dart';
import '../con_folder/Permanences_Contoller.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import '../con_folder/Permission_Controller.dart';
class permission extends StatelessWidget {
 var controller = Get.put(permission_Controller());
  permission_Controller controller4;

  // permission(List<PermanenceModel> details_permission);


  permission({required this.controller4});
  @override
  Widget build(BuildContext context) {
    return

    GetBuilder<permission_Controller>(
        builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest_permission,
        widget:

          Padding(
                    padding: EdgeInsets.only(top:20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircularPercentIndicator(
                                radius: 100.0,
                                lineWidth: 2.0,
                                animation: false,
                                percent: 1,
                                center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("الإذن الكليّ ",
                                          style:  TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22.0,
                                              color: AppColor.greenso)),
                                      Text("${controller4.details_permission.first.allCount}",
                                          style:TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22.0,
                                              color: AppColor.greenso))
                                    ]),
                                footer:   Column(
                                    mainAxisAlignment: MainAxisAlignment.center,

                                    children: [
                                      Padding(padding: EdgeInsets.only(left: 30,right: 30,bottom: 10,top: 40),
                                          child:
                                          ListTile(
    onTap:()async {
      if('${controller4.details_permission.first.allCount}'!='0')

      {
        await controller.show_info_permission_in();


        //sittengmodalbottomSheet(context,"1a",AppColor.purple1);
        df(context, "1p", AppColor.purple1, controller.details_permission_in,
            controller.statusRequest_permission_in);
      }
      else
      Get.defaultDialog(
          title: ' ',
          titleStyle:  TextStyle(color: AppColor.primaryColor , fontWeight: FontWeight.bold),
          middleText: "لايوجد أذونات لعرضها"
      );

    },
                                            trailing: Icon(Icons.arrow_circle_down_outlined,size: 40),

                                            minVerticalPadding:1,
                                            iconColor:AppColor.white,
                                            minLeadingWidth: 30,
                                            horizontalTitleGap: 78,
                                            tileColor: AppColor.purple1,
                                            shape: RoundedRectangleBorder( //<-- SEE HERE


                                              borderRadius: BorderRadius.circular(20),
                                            ),


                                            title:Center(child: Text(
                                              "الأذونات ",
                                              style: TextStyle(color: AppColor.white,fontSize: 20),
                                            ),),
                                            subtitle:   Center(child:Text("${controller4.details_permission.first.allCount}",
                                              style: TextStyle(color: AppColor.white,fontSize: 20),

                                            ),),

                                          )
                                      ),

                                    ]),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: AppColor.blue_splash,
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  )));

    }

  DraggableScrollableSheet _buildDraggableScrollableSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.2,
      minChildSize: 0.2,
      maxChildSize: 0.8,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            // border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Scrollbar(
            child: ListView.builder(
              controller: scrollController,
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text('Item $index'),
                );
              },
            ),
          ),
        );
      },
    );
  }
}


class TablesPageState extends StatelessWidget {
  // Generate a list of fiction prodcts
  final List<Map> _products = List.generate(30, (i) {
    return {
      "id": i,
      "dfdf": "Product $i",
      "name": "Product $i",
      "price":4+ 1
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kindacode.com'),
        ),
        body: Container(
          padding: EdgeInsets.all(22),
          width: double.infinity,
          child: SingleChildScrollView(
            child: DataTable(
              //dividerThickness: 2,
              decoration: BoxDecoration(
                // border:Border(
                //     right: Divider.createBorderSide(context, width: 2.0),
                //     left: Divider.createBorderSide(context, width: 2.0)
                // ),
                color: Colors.white30,
              ),
              showBottomBorder: true,
              // sortColumnIndex: _currentSortColumn,
              // sortAscending: _isAscending,
              columnSpacing:7,
              headingRowColor: MaterialStateProperty.all(Colors.amber[200]),
              columns: [
                DataColumn(label: Text('السبب ',)),
                // DataColumn(label: Text('المستأذن ',)),
                DataColumn(label: Text(' المدة ')),
                DataColumn(label: Text(' تاريخ ')),
                DataColumn(label: Text(' يوم ')),
                DataColumn(label: Text(' فصل '))
              ],
              rows: _products.map((item) {
                return DataRow(cells: [
                  DataCell(Text(item['id'].toString())),
                  DataCell(Text(item['id'].toString() + 'op')),
                  DataCell(Text(item['name'])),
                  DataCell(Text(item['name'])),
                  DataCell(Text(item['price'].toString()))
                ]);
              }).toList(),
            ),
          ),
        ));
  }


}
