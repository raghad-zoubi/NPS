import 'package:nps/controller/Home_Contoller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../Noti/SingltoneNotification.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/function/alertexitapp.dart';
import '../../data/datasource/static/static.dart';
import '../../main.dart';
// class DialogUtils {
//   static DialogUtils _instance =  DialogUtils.internal();
//
//   DialogUtils.internal();
//
//   factory DialogUtils() => _instance;
//
//   static void showCustomDialog(BuildContext context,
//       {required String title,
//       String okBtnText = "Ok",
//       String cancelBtnText = "Cancel",
//       required Function okBtnFunction}) {
//     showDialog(
//         context: context,
//         builder: (_) {
//           return AlertDialog(
//             title: Text(title),
//             content: Text('pop'),
//             actions: <Widget>[
//               FloatingActionButton(
//                 child: Text(okBtnText),
//                 onPressed: () {},
//               ),
//               FloatingActionButton(
//                   child: Text(cancelBtnText),
//                   onPressed: () => Navigator.pop(context))
//             ],
//           );
//         });
//   }
// }
//


class Home extends StatelessWidget {
 // ConstData _constData = new ConstData();

  @override
  Widget build(BuildContext context) {
    Get.put(Home_Controller());
 // Get.put(SingltoneNotification());

    return
      Scaffold(
        backgroundColor:AppColor.primaryColor,
      appBar: PreferredSize(
       preferredSize: Size.fromHeight(150.0),
        child:
        GetBuilder<Home_Controller>(
          builder: (controller) =>
        appBar( name: '${controller.name}',))
      ),
      body:   Container(
    decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(60),
    topRight: Radius.circular(60),
    ),
    color: Colors.white,
    ),
          child:  WillPopScope(
        onWillPop: alertExitApp,
        child:

                GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: icon_home.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      var item = icon_home[index];


                      return Padding(
                          padding: const EdgeInsets.only(left: 36, right: 36),
                          child: InkWell(
                            onTap: () {
                              print(
                                  '____________________________________________________________________________');
                              print(
                                  'ITEM ID FOM HOME SCREEN WICH MEAN CATEGORY1  &&  GO TO CATEGORY2');
                              print(item.id);
                              if (item.id == 1)
                                Get.toNamed(AppRoutes.grades);
                              else if (item.id == 5)
                                Get.toNamed(AppRoutes.ads);
                              else if (item.id == 0)
                                Get.toNamed(AppRoutes.notes);
                              else if (item.id == 4)
                                Get.toNamed(AppRoutes.program);
                              else if (item.id == 6)
                                Get.toNamed(AppRoutes.Budgets);
                              else if (item.id == 3)
                                Get.toNamed(AppRoutes.permanence);
                              else if (item.id == 2)
                                Get.toNamed(AppRoutes.courses);
                            },
                            child: Container(
                              //padding: EdgeInsets.only(top:20),
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                boxShadow: [
                                  // to make elevation
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(2, 2),
                                    blurRadius: 4,
                                  ),
                                  // to make the coloured border
                                  BoxShadow(
                                    color: Colors.blue,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),

                              width: MediaQuery.of(context).size.width * 2,
                              height: MediaQuery.of(context).size.height / 11,
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Image(
                                        image: AssetImage(
                                            '${item.icon}'),
                                        fit: BoxFit.contain,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                12,
                                      ),
                                      //CachedNetworkImage(imageUrl: photos[int].url),
                                      Center(
                                        child: Text(
                                          '${item.name}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal),
                                        ),
                                        // '${item.BasicImage}'),
                                      ),
                                    ]),
                              ),
                            ),
                          ));
                    })

        )),
    );
  }
}

class appBar extends StatelessWidget {
  String name;
  appBar({required this.name} );

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        elevation: 0,
        backgroundColor:AppColor.primaryColor,
        toolbarHeight: 130,
        title: Container(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[


                    Text(
                      "مدرسة الأهلية الوطنية",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(children: [
                      Icon(Icons.person, size: 33, color: AppColor.white),
                      Text(" $name",
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                          )),
                    ]),
                  ]),
              Column(children: [
                PopupMenuButton(
                    itemBuilder: (_) => const <PopupMenuItem<int>>[
                      PopupMenuItem<int>(
                        value: 1,
                        child: Text(" تسجيل الخروج",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                            )),

                      ),
                      PopupMenuItem<int>(
                        value: 2,

                        child: Text("   كتابة شكوى",
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                            )),

                      ),
                    ],
                    onSelected: (value) {
                      if(value==1)
                        alertgoutApp();
                      else {
                      alertreportApp();
                      }

                    }
                ),
              ],)

            ],
          ),
        ));
  }
}

