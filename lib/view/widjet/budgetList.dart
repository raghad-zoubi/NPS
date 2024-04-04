

import 'package:flutter/material.dart';
import '../../core/constant/color.dart';

class Budgetslist extends StatelessWidget {
  var payment;
  var date;
  var id;
  Budgetslist({
    required this.payment ,required this.date,required this.id, });


  @override
  Widget build(BuildContext context) {
    return

      Padding(
          padding: EdgeInsets.all(6),
          child:Card(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[

                    ListTile(
                      shape: RoundedRectangleBorder( //<-- SEE HERE
                        side: BorderSide(color: AppColor.blue_splash,width: 2),

                        borderRadius: BorderRadius.circular(20),
                      ), title:

          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: RichText(
              textAlign: TextAlign.right,
              text: TextSpan(
                text:
                'تم دفع مبلغ   ',
                style: TextStyle(
                    color:AppColor.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight. normal ),
                children: <TextSpan>[
                  TextSpan(
                    text:
                    "$payment",
                    style: TextStyle(
                      color: AppColor.orang11,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              TextSpan(
                text:
                '  ل.س  ',
                style: TextStyle(
                    color:AppColor.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight. normal ),
                )
                ],
              ),
            ),
          ),
                      leading: //
                      Icon(Icons.monetization_on_outlined,color: Colors.green),

                      subtitle:
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            text:
                            'بتاريخ  ',
                            style: TextStyle(
                                color:AppColor.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight. normal ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                "$date",
                                style: TextStyle(
                                  color: AppColor.greenso,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // TextSpan(
                              //   text:
                              //   "$payment.\n",
                              //   //        'Sed ac est non dolor aliquam tincidunt. Vestibulum non semper nisl. Vivamus condimentum massa eget efficitur faucibus. Sed ligula diam, aliquet eu est id, consectetur bibendum nibh. Sed et nulla vitae lectus hendrerit lacinia. Sed euismod elementum aliquam. Fusce sit amet ligula ac orci ullamcorper hendrerit vel eu est. Nam vestibulum, eros nec bibendum auctor, odio sapien euismod est, quis blandit ipsum sapien eu sapien. Nullam ut enim massa. Nullam bibendum, sapien sit amet tempor fermentum, elit urna bibendum nisl, non bibendum ipsum velit in tellus. Praesent egestas maximus nibh, a luctus enim hendrerit non. Sed ut ligula vel metus malesuada tempus eget at neque. In auctor arcu ligula, vel euismod ex tempor eu. Proin non aliquam leo, sed facilisis lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
                              //   style: TextStyle(
                              //     color: AppColor.orang1,
                              //     fontSize: 16.0,
                              //     fontWeight: FontWeight.normal,
                              //   ),
                              // ),
                              //
                            ],
                          ),
                        ),
                      ),
                    ) ,





                  ])));

  }
}
