import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class Programlist extends StatelessWidget {
  var times;
  var subject;

  Programlist(
      {required this.times,
        required this.subject,
      });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text("${subject}",
                                  style: const TextStyle(
                                      fontSize: 17, color: AppColor.white)),
                              Text(" $times",
                                  style: const TextStyle(
                                      fontSize: 17, color: AppColor.white)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
