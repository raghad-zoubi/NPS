import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../core/class/handlingdataview.dart';

import '../../../controller/Inside_Controller/Budgets_Controller.dart';
import '../../../core/class/statusrequest.dart';
import '../../../core/constant/color.dart';
import '../../widjet/budgetList.dart';

class Budgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(Budgets_Controller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text(
            "مدرسة الأهلية الوطنية",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<Budgets_Controller>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.c.isNotEmpty
                   ?
                Column(children: [
                        Flexible(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(top: 22.0, bottom: 22),
                              child: CircularPercentIndicator(
                                radius: 130.0,
                                lineWidth: 22.0,
                                animation: true,
                                percent: controller.percent!,

                                center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("المبلغ المتبقي",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22.0,
                                              color: AppColor.black)),
//                                 Text("32$4",
                                  //    Text("${controller.still}",
                                      Text("${controller.still}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22.0,
                                              color: AppColor.redso))
                                    ]),
                                footer: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
//                                  "dfاخر تحديث منذ ",
                                    " ",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ]),
                                //   circularStrokeCap: CircularStrokeCap.round,
                                progressColor: AppColor.Budgets,
                              ),
                            )),
                        Flexible(
                            flex: 3,
                            child: Container(
                             child:
                              ListView.builder(
                                itemCount:  controller.c.length,
                                //    shrinkWrap: true,
                                padding: EdgeInsets.only(top: 16),

                                itemBuilder: (context, index) {

                                  return Budgetslist(
                                      payment: controller.c[index]["payment"],
                                      date: controller.c[index]["date"],
                                      id:controller.c[index]["id"],
                                      );
                                },
                              // ),
                              //
                              //   child: ListView.builder(
                              //     itemCount:
                              //    controller.c.length,
                              //     //    shrinkWrap: true,
                              //     padding: EdgeInsets.only(top: 16),
                              //
                              //     itemBuilder: (context, index) {
                              //
                              //       return Budgetslist(
                              //         payment:'item.payment.toString()',
                              //         date:'item.date.toString()',
                              //         id:'item.id.toString()',
                              //       );
                              //     },
                                ),
                            ))
                      ]) :
                    Column(children: [
                        Flexible(
                            flex: 3,
                            child: Padding(
                              padding: EdgeInsets.only(top: 22.0, bottom: 22),
                              child: CircularPercentIndicator(
                                radius: 130.0,
                                lineWidth: 22.0,
                                animation: true,
                                percent: 0.0,
                                //controller.details.first.percent!,

                                center: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("المبلغ المتبقي",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 22.0,
                                              color: AppColor.black)),
//
                                      Text("${controller.still}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 22.0,
                                              color: AppColor.redso))
                                    ]),
                                //   footer:

                                //   circularStrokeCap: CircularStrokeCap.round,
                                //      progressColor: AppColor.Budgets,
                              ),
                            )),
                        Flexible(
                            flex: 3,
                            child: Center(child:  Container(
                                child: ListView(
                                  children: [Text('                      لم يتم تقديم اية دفوعات بعد',
                                    style: TextStyle(color:Colors.black),)],
                                )) ,)
                          )
                     ]
           )
        )
    ));
  }
}
