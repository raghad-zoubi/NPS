import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomCardProfile extends StatelessWidget {
  final String ?fName;
  final String ?lName;
  final String ?image;
  CustomCardProfile(
      {required this.fName, required this.lName, required this.image});
  @override
  Widget build(BuildContext context) {
 double height=   MediaQuery.of(context).size.height;
 double width=   MediaQuery.of(context).size.width ;
    return Container(
        height:MediaQuery.of(context).orientation==Orientation.portrait?height/4:height/2,
        width: width ,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: AppColor.thirdColor,
            border: Border.all(
                width: 6,
                color: AppColor.primaryColor),
            borderRadius:
            const BorderRadius.all(
                Radius.circular(20))),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 3,
                  color: Colors.white),
              borderRadius:
              const BorderRadius.all(
                  Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                 // flex:1 ,
                  child: Container(
                    height:150 ,
                    width:120  ,
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: AppColor.white,
                        ),
                        borderRadius: BorderRadius.circular(390),
                        image: DecorationImage(
                            image: NetworkImage("$image"),
                            fit: BoxFit.fill)),
                  ),
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: " $fName",
                      style: const TextStyle(fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: AppColor.white),
                      children: <TextSpan>[
                        TextSpan(text: "$lName",),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}


/*
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomCardHomeextends StatelessWidget {
  final String ?fName;
  final String ?lName;
  final String ?image;
  CustomCardProfile(
      {required this.fName, required this.lName, required this.image});
  @override
  Widget build(BuildContext context) {
 double height=   MediaQuery.of(context).size.height;
 double width=   MediaQuery.of(context).size.width ;
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: AppColor.thirdColor,
            border: Border.all(
                width: 6,
                color: AppColor.primaryColor),
            borderRadius:
            const BorderRadius.all(
                Radius.circular(20))),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 3,
                  color: Colors.white),
              borderRadius:
              const BorderRadius.all(
                  Radius.circular(20))),
          child: Row(
            children: [
              Container(
                height:MediaQuery.of(context).orientation==Orientation.portrait?height/4:height/3,
                width: MediaQuery.of(context).orientation==Orientation.portrait?width/2:width/2 ,
                margin: const EdgeInsets.only(
                    left: 10,
                    top: 5,
                    bottom: 7,
                    right: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: AppColor.white,
                    ),
                    borderRadius: BorderRadius.circular(390),
                    image: DecorationImage(
                        image: NetworkImage("$image"),
                        fit: BoxFit.fill)),
              ),
              RichText(
                text: TextSpan(
                  text: " $fName",
                  style: const TextStyle(fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColor.white),
                  children: <TextSpan>[
                    TextSpan(text: "$lName",),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}




 */