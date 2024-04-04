
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../core/class/handlingdataview.dart';
import '../core/constant/color.dart';

import '../data/datasource/static/static.dart';
import '../main.dart';
import 'directory_path.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as Path;

import 'Ads_Controller.dart';

class Ads extends StatelessWidget {
  var controller = Get.put(Ads_Controller());

  @override
  Widget build(BuildContext context) {
   return Scaffold(
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

            elevation: 2,
            bottom: TabBar(
                onTap: (index) {
                  if (index == 0){
                    controller.show_info_file(1);

              }
                  else
                    controller.show_info_file(2);
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
                            "اعلانات عامه") //,style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(" اعلانات الصفوف"),
                      //,style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ]),
          ),
          body:

          TabBarView(children: [
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: GetBuilder<Ads_Controller>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                          margin: const EdgeInsets.only(
                              top: 20.0, right: 12.0, left: 12.0),
                          padding: const EdgeInsets.only(
                              top: 20, right: 3.0, left: 3.0),
                          // decoration: BoxDecoration(
                          //   //  border: Border.all(color: Colors.blueAccent)
                          //   border: Border.all(
                          //       width: 1, color: Colors.blueAccent),
                          //   borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(30.0),
                          //     topRight: Radius.circular(30.0),
                          //   ),
                          // ),
                          child: ListView.builder(
                              itemCount: controller.details.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                var data = controller.details[index];
                                print(data.title);
                                return TileList(
                                  fileUrl: //"https://download.samplelib.com/mp4/sample-20s.mp4",
                                  "$photo/${data.text}",
                                  //"http://192.168.141.21:8000/cc.jpg",
                                  title: data.title!,
                         //data.icon!,
                                );
                              })))),
            ),

            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: GetBuilder<Ads_Controller>(
                  builder: (controller) => HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                          margin: const EdgeInsets.only(
                              top: 20.0, right: 12.0, left: 12.0),
                          padding: const EdgeInsets.only(
                              top: 20, right: 3.0, left: 3.0),
                          // decoration: BoxDecoration(
                          //   //  border: Border.all(color: Colors.blueAccent)
                          //   border: Border.all(
                          //       width: 1, color: Colors.blueAccent),
                          //   borderRadius: BorderRadius.only(
                          //     topLeft: Radius.circular(30.0),
                          //     topRight: Radius.circular(30.0),
                          //   ),
                          // ),
                          child: ListView.builder(
                              itemCount: controller.details.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                var data = controller.details[index];
                                print(data.title);
                                return TileList(
                                  fileUrl: //"https://download.samplelib.com/mp4/sample-20s.mp4",
                                  "$link/${data.text}",
                                  //"http://192.168.141.21:8000/cc.jpg",
                                  title: data.title!//data.icon!,
                                );
                              })))),
            ),
          ]),
        ),
      ),
    );
  }
}
class AdsFile extends StatelessWidget {
  var controller = Get.put(Ads_Controller());

  @override
  Widget build(BuildContext context) {
    Get.put(Ads_Controller());
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppColor.primaryColor,

        title:
        Text(
          "مدرسة الأهلية الوطنية",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
       // actions: <Widget>[
        //  IconButton(icon: Icon(Icons.arrow_forward_sharp), onPressed: () {
        //    Get.offAllNamed(AppRoutes.Home);
    // })
      //  ],


      ),
      // body: WillPopScope(
      //onWillPop: alertExitApp,  ),
      //child:
      body:
      Column(
        children: [
          Flexible(
              flex: 1,
              child:
              // Padding(
              //     padding: EdgeInsets.only(top: 22.0,bottom: 22),)

              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: icon_ads.length,
                  // gridDelegate:
                  // const SliverGridDelegateWithFixedCrossAxisCount(
                  // crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    var item = icon_ads[index];

                    return InkWell(
                        onTap: () {
                          print(
                              '____________________________________________________________________________');
                          print(
                              'ITEM ID FOM HOME SCREEN WICH MEAN CATEGORY1  &&  GO TO CATEGORY2');
                          print(item.name2);
                          //   controller.item=item.id!;
                          controller.show_info_file(item.nameads!);
                        },
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 2,
                                bottom: 3,
                                left: 12.0,
                                right: 12.0),
                            child: Container(
                              height: 100,
                              width: 105,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                  width:5,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              // child: Column(
                              //   children: [
                              //     Container(
                              //       child: new Image(
                              //         image: AssetImage('${item.icon}'),
                              //         fit: BoxFit.fill,
                              //
                              //         height: 40,
                              //         width: 40,
                              //         //
                              //       ),
                              //       padding:
                              //       const EdgeInsets.only(top: 10),
                              //     ),
                              //     Container(
                              //       decoration: const BoxDecoration(
                              //           borderRadius: BorderRadius.only(
                              //               bottomRight:
                              //               Radius.circular(70.0),
                              //               bottomLeft:
                              //               Radius.circular(70.0))),
                              //       child: Text(" ${item.name} ",
                              //           style: TextStyle(
                              //               color: Colors.black,
                              //               fontStyle:
                              //               FontStyle.italic)),
                              //       padding:
                              //       const EdgeInsets.only(top: 2),
                              //     )
                              //   ],
                              // ),
                            ),
                          ),
                        )


                    );
                  })),

          Flexible(
            flex: 5,
            child:
            Padding(
              padding: EdgeInsets.only(top: 0.0),
              child: GetBuilder<Ads_Controller>(
                  builder: (controller) => HandlingDataRequest(
                      statusRequest: controller.statusRequest,
                      widget: Container(
                          margin: const EdgeInsets.only(
                              top: 20.0, right: 12.0, left: 12.0),
                          padding: const EdgeInsets.only(
                              top: 20, right: 3.0, left: 3.0),

                          child: ListView.builder(
                              itemCount: controller.details.length,
                              itemBuilder:
                                  (BuildContext context, int index) {
                                var data = controller.details[index];
                                print(data.title);
                                return TileList(
                                  fileUrl: //"https://download.samplelib.com/mp4/sample-20s.mp4",
                                  "$photo/${data.text}",
                                  //"http://192.168.141.21:8000/cc.jpg",
                                  title: data.title!, //data.icon!,
                                );
                              })))),
            ),
          )

//   controller. isPermission ?

// : TextButton(
//     onPressed: () {
//   //   controller. checkPermission();
//     },
//     child: const Text("Permission issue")),
        ],
      )

    );
  }
}
class TileList extends StatefulWidget {
  TileList(
  {super.key,
  required this.fileUrl,
  required this.title});

  final String fileUrl;
  final String title;


  @override
  State<TileList> createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  bool dowloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String filePath;
  late CancelToken cancelToken; //=CancelToken();
  var getPathFile = DirectoryPath();
  IconData sd = Icons.video_library;

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    setState(() {
      print(widget.fileUrl);
      dowloading = true;
      progress = 0;
    });

    try {
      await Dio().download(widget.fileUrl, filePath,
          onReceiveProgress: (count, total) {
            setState(() {
              progress = (count / total);
            });
          }, cancelToken: cancelToken);
      setState(() {
        dowloading = false;
        fileExists = true;
      });
    } catch (e) {
      print(e);
      setState(() {
        dowloading = false;
      });
    }
  }

  cancelDownload() {
    cancelToken.cancel();
    setState(() {
      dowloading = false;
    });
  }

  checkFileExit() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
  }

  openfile() {
    OpenFile.open(filePath);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fileName = Path.basename(widget.fileUrl);
    });
    checkFileExit();
  }

  @override
  Widget build(BuildContext context) {
    return
  Container(

     decoration: BoxDecoration(
       //  border: Border.all(color: Colors.blueAccent)
       border: Border.all(
           width:2, color: Colors.blue),
       borderRadius: BorderRadius.only(
         topLeft: Radius.circular(30.0),
         topRight: Radius.circular(30.0),
         bottomLeft: Radius.circular(30.0),
         bottomRight: Radius.circular(30.0),
       ),
     ),

     margin: EdgeInsets.only(top: 10, bottom: 10),
     padding:EdgeInsets.only(top: 10, bottom: 20),
     height: 100,
     child:

         Center(
           // Directionality (
           //    textDirection: TextDirection.ltr, // or TextDirection.ltr
             child: //widget.fileUrl != "null"
             // ?
             ListTile(
               leading:  Container(

                 decoration: BoxDecoration(
                   color: AppColor.white,
                   borderRadius: BorderRadius.circular(10),
                   border: Border.all(
                       width:1, color: Colors.blue),
                   //   border: Border.all(color: Colors.blueAccent)
                   //   borderRadius: BorderRadius.only(
                   //   topLeft: Radius.circular(30.0),
                   //   topRight: Radius.circular(30.0),
                   //   bottomLeft: Radius.circular(30.0),
                   //   bottomRight: Radius.circular(30.0),
                 ),

                 height: 140,
                 width: 100,
                 child:

                 Row(
                   crossAxisAlignment: CrossAxisAlignment.end,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     IconButton(
                         onPressed: () {
                           fileExists && dowloading == false
                               ? openfile()
                               : startDownload();
                         },
                         icon: fileExists
                             ?
                         Visibility(
                             visible: false,child: const Icon(

                           Icons.hourglass_empty_rounded,
                           color: Colors.green,
                         )
                         )
                             :
                         dowloading
                             ?
                         Stack(
                           alignment: Alignment.center,
                           children: [
                             CircularProgressIndicator(
                               value: progress,
                               strokeWidth: 3,
                               backgroundColor: Colors.deepOrange,
                               valueColor:
                               const AlwaysStoppedAnimation<
                                   Color>(Colors.blue),
                             ),
                             Text(
                               "${(progress * 100).toStringAsFixed(2)}",
                               style: TextStyle(fontSize: 12),
                             )
                           ],
                         )
                             : const Icon(
                           Icons.arrow_circle_down_outlined,
                           color: Colors.deepOrange,)),
                     IconButton(
                         onPressed: () {
                           fileExists && dowloading == false
                               ? openfile()
                               : cancelDownload();
                         },
                         icon: fileExists && dowloading == false
                             ? const Icon(
                           Icons.slideshow,
                           color: Colors.green,
                         )
                             :
                         const Icon(Icons.close,color: Colors.deepOrange,)),
                   ],
                 ),

                 //     Text('2023_7_1',style: TextStyle(color: Colors.green)),

               ),
               //    trailing:
               subtitle : Text(
                 widget.title,
                 overflow: TextOverflow.fade,
                 style: TextStyle(color: Colors.black),
               ) ,



             )

           //     :
           // Container(
           //   //   margin: const EdgeInsets.only(top:20.0,right:12.0,left:12.0),
           //   padding: const EdgeInsets.only(
           //       top: 20, right: 3.0, left: 3.0, bottom: 20),
           //
           //   decoration: BoxDecoration(
           //     //  border: Border.all(color: Colors.blueAccent)
           //     border: Border.all(width: 3, color: Colors.amber),
           //     borderRadius: BorderRadius.only(
           //       topLeft: Radius.circular(30.0),
           //       topRight: Radius.circular(30.0),
           //     ),
           //   ),
           //   child: Text(
           //     widget.title,
           //     style: TextStyle(color: Colors.black),
           //   ),
           // )

         ),
  //  Text('2023_7_1',style: TextStyle(color: Colors.green)),

//)
   )

;
  }
}
