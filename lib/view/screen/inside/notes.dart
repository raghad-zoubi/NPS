
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../controller/Inside_Controller/Notes_Contoller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/alertexitapp.dart';
import '../../widjet/NotesList.dart';

class Notes extends StatelessWidget {
  var controller = Get.put(Notes_Controller());

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.primaryColor,
              title: Text(
                "   مدرسة الأهلية الوطنية  ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              // actions: <Widget>[
              //   IconButton(
              //       icon: Icon(Icons.arrow_forward_sharp),
              //       onPressed: () {
              //         Get.offAllNamed(AppRoutes.Home);
              //       })
              // ],
              elevation: 2,
              bottom: TabBar(
                  onTap: (index) {
                    if (index == 1){
                      controller.show_info_Notes_s();
                    }
                    else
                      controller.show_info_Notes_a();
                  },
                  labelColor: Color(0xff499AF6),
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  tabs: [
                    Tab(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              "ملاحظات سلوكية") //,style: TextStyle(fontSize: 20)),
                          ),
                    ),
                    Tab(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("ملاحظات علمية"),
                        //,style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ]),
            ),
            body:
            // Padding(
            //   padding: EdgeInsets.only(top: 20.0),
            //   child: )
              TabBarView(children: [
                GetBuilder<Notes_Controller>(
                    builder: (controller) => HandlingDataView(
                          statusRequest: controller.statusRequest_s,
                        widget:
                        SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

SizedBox(height: 20,),

                         //  Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: <Widget>[

                         Flexible(child:
                             //  Text('Hey'),
                                ListView.builder(
                                  itemCount: controller.details_s.length,
                               shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 16),
                               physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var item = controller.details_s[index];
print("___________________");
print(controller.details_s.length);
                                    return //Text("pop");
                                      NotesList(
                                        name: item.name.toString(),
                                      text: item.text.toString(),
                                      semester: item.semester.toString(),
                                      date: item.date.toString(),
                                      id: item.id.toString(),
                                          type:'s'
                                      // isMessageRead: (index == 0 || index == 3)?true:false,
                                    );
                                  },
                    ),
                         )

                    ],
                       ),
                          ),
                      ),
            ),
    //),
                GetBuilder<Notes_Controller>(
                    builder: (controller) => HandlingDataView(
                          statusRequest: controller.statusRequest_a,
                          widget:
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Flexible(child:
                                ListView.builder(
                                  itemCount: controller.details_a.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 16),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var item = controller.details_a[index];
                                    return NotesList(
                                      name: item.name.toString(),
                                      text: item.text.toString(),
                                      semester: item.semester.toString(),
                                      date: item.date.toString(),
                                      id: item.id.toString(),
                                      type:'as' ,

                                      // isMessageRead: (index == 0 || index == 3)?true:false,
                                    );
                                  },
                                ),
                                )
                              ],
                            ),
                          ),
                        )),
              ]),
           ),
      ),
    );
  }
}
