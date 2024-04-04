import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nps/core/constant/color.dart';


class NotesList extends StatelessWidget{
  var name;
  var text;
  var semester;
  var date;
  var id;
  var type;
  NotesList({
    required this.name,required this.text,
    required this.semester,required this.date,required this.id,required this.type, });
  @override
  Widget build(BuildContext context) {


    return
      Padding(padding: EdgeInsets.all(7),
      child:Card(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

      ListTile(
        shape: RoundedRectangleBorder( //<-- SEE HERE
          side: BorderSide(color: AppColor.blue_splash,width: 2),

          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
         " $text.\n",
          style:    TextStyle(  color: Colors.black,
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
          )
        ),
        leading: //
        Icon(Icons.album),

            subtitle: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: type=='s'?  RichText(
                textAlign: TextAlign.right,

                text:
                TextSpan(
                  text:
                  "الفصل: $semester.\n" ,
                  style: TextStyle(
                      color:AppColor.blue_splash,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[

                    TextSpan(
                      text:
                      '$date.\n',
                      //        'Sed ac est non dolor aliquam tincidunt. Vestibulum non semper nisl. Vivamus condimentum massa eget efficitur faucibus. Sed ligula diam, aliquet eu est id, consectetur bibendum nibh. Sed et nulla vitae lectus hendrerit lacinia. Sed euismod elementum aliquam. Fusce sit amet ligula ac orci ullamcorper hendrerit vel eu est. Nam vestibulum, eros nec bibendum auctor, odio sapien euismod est, quis blandit ipsum sapien eu sapien. Nullam ut enim massa. Nullam bibendum, sapien sit amet tempor fermentum, elit urna bibendum nisl, non bibendum ipsum velit in tellus. Praesent egestas maximus nibh, a luctus enim hendrerit non. Sed ut ligula vel metus malesuada tempus eget at neque. In auctor arcu ligula, vel euismod ex tempor eu. Proin non aliquam leo, sed facilisis lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
                      style: TextStyle(
                        color: AppColor.greenso,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ):
              RichText(
                textAlign: TextAlign.right,

                text:
                TextSpan(
                  text:
                  "المادة: $name.\n",
                  style: TextStyle(
                      color:AppColor.blue_splash,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  children: <TextSpan>[

                    TextSpan(
                      text:
                    "الفصل: $semester.\n",
              //        'Sed ac est non dolor aliquam tincidunt. Vestibulum non semper nisl. Vivamus condimentum massa eget efficitur faucibus. Sed ligula diam, aliquet eu est id, consectetur bibendum nibh. Sed et nulla vitae lectus hendrerit lacinia. Sed euismod elementum aliquam. Fusce sit amet ligula ac orci ullamcorper hendrerit vel eu est. Nam vestibulum, eros nec bibendum auctor, odio sapien euismod est, quis blandit ipsum sapien eu sapien. Nullam ut enim massa. Nullam bibendum, sapien sit amet tempor fermentum, elit urna bibendum nisl, non bibendum ipsum velit in tellus. Praesent egestas maximus nibh, a luctus enim hendrerit non. Sed ut ligula vel metus malesuada tempus eget at neque. In auctor arcu ligula, vel euismod ex tempor eu. Proin non aliquam leo, sed facilisis lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
                      style: TextStyle(
                        color: AppColor.orang11,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text:
                      '$date.\n',
                      //        'Sed ac est non dolor aliquam tincidunt. Vestibulum non semper nisl. Vivamus condimentum massa eget efficitur faucibus. Sed ligula diam, aliquet eu est id, consectetur bibendum nibh. Sed et nulla vitae lectus hendrerit lacinia. Sed euismod elementum aliquam. Fusce sit amet ligula ac orci ullamcorper hendrerit vel eu est. Nam vestibulum, eros nec bibendum auctor, odio sapien euismod est, quis blandit ipsum sapien eu sapien. Nullam ut enim massa. Nullam bibendum, sapien sit amet tempor fermentum, elit urna bibendum nisl, non bibendum ipsum velit in tellus. Praesent egestas maximus nibh, a luctus enim hendrerit non. Sed ut ligula vel metus malesuada tempus eget at neque. In auctor arcu ligula, vel euismod ex tempor eu. Proin non aliquam leo, sed facilisis lacus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
                      style: TextStyle(
                        color: AppColor.greenso,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ) ,



              // Row(children: [  Text(semester  ,style: TextStyle(color: AppColor.blue_splash,fontSize: 25),
              //   overflow: TextOverflow.ellipsis, maxLines: 3,),
              //   Text(subject_id ,style: TextStyle(color: AppColor.Budgets,fontSize: 25),
              //     overflow: TextOverflow.ellipsis, maxLines: 3,),
              //   Text(" $date " ,style: TextStyle(color: AppColor.orang1,fontSize: 25), overflow: TextOverflow.ellipsis, maxLines: 3,),
              // ],)



            ])))
 ;

  }
}
