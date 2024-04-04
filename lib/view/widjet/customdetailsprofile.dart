import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class CustomDetailsProfile extends StatelessWidget {
  final String ?subject;
  final String ?desc;


  CustomDetailsProfile(
      {required this.subject, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.animation,
                color: AppColor.blue_splash,
                size: 33,
              ),
              RichText(
                  text: TextSpan(
                      text: '41'.tr,
                      style: TextStyle(
                          color: AppColor.blue_splash,
                          fontSize: 20),
                      children: <TextSpan>[
                        TextSpan(
                            text: "$subject",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 17)),
                      ])),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Flexible(
                    child: Row(
                      children: [
                        Icon(
                          (Icons.description),
                          color: AppColor.blue_splash,
                          size: 33,
                        ),
                        Text(
                          '42'.tr,
                          style: TextStyle(
                              color: AppColor.blue_splash,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
               // Spacer(),
                Expanded(
                  flex: 2,
                  child: Text(
                    "$desc",
                    style: const TextStyle(
                        color: Colors.black, fontSize: 17),
                  ),
                ),
              ],
            ),
          ),

        ],

      ),
    );
  }
}
