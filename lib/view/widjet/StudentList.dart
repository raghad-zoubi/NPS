import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class Studentlist extends StatelessWidget {
  var lastname;
  var fname;
  var grades;
  var tid;
  var sid;
  Studentlist(
      {required this.lastname,
      required this.fname,
      required this.grades,
      required this.tid,
      required this.sid});
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
                              Text("${fname}",
                                  style: const TextStyle(
                                      fontSize: 17, color: AppColor.white)),
                              Text(" $lastname",
                                  style: const TextStyle(
                                      fontSize: 17, color: AppColor.white)),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(" العلامة:",
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColor.white)),
                              Text("${grades}",
                                  style: const TextStyle(
                                      fontSize: 15, color: AppColor.white)),
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
