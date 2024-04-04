import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as Path;
import 'package:nps/core/constant/color.dart';

import 'package:http/http.dart' as http;
import '../core/class/handlingdataview.dart';
import '../core/constant/routes.dart';
import '../core/function/alertexitapp.dart';
import '../data/datasource/static/static.dart';
import '../main.dart';
import 'File_Model.dart';
import 'Files_Contoller.dart';
import 'check_permission.dart';
import 'directory_path.dart';

class FileListc extends StatelessWidget {
  var controller = Get.put(File_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: Text(
            "مدرسة الأهلية الوطنية",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body:
            // WillPopScope(
            //     onWillPop: alertExitApp,
            //     child:    ),
            Column(
          children: [
            Flexible(
                flex: 1,
                child:
                    // Padding(
                    //     padding: EdgeInsets.only(top: 22.0,bottom: 22),)

                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: icon_courses.length,
                        itemBuilder: (context, index) {
                          var item = icon_courses[index];
                          return InkWell(
                              onTap: () {
                                print(
                                    '____________________________________________________________________________');
                                print(
                                    'ITEM ID FOM HOME SCREEN WICH MEAN CATEGORY1  &&  GO TO CATEGORY2');
                                print(item.name2);
                                controller.changeColor(item.id!);
                                controller.show_info_file(item.name2!);
                                controller.icone(item.id!);
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
                                      color: Colors.black12,
                                      border: Border.all(
                                        color: Colors.blueAccent,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: new Image(
                                            image: AssetImage('${item.icon}'),
                                            fit: BoxFit.fill,
                                            height: 40,
                                            width: 40,
                                            //
                                          ),
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                        ),
                                        Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(70.0),
                                                  bottomLeft:
                                                      Radius.circular(70.0))),
                                          child: Text(" ${item.name} ",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic)),
                                          padding:
                                              const EdgeInsets.only(top: 2),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                        })),
            Flexible(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(top: 0.0),

                child:
                GetBuilder<File_Controller>(
                      builder: (controller) =>

                          HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget:
                            Container(
                            margin: const EdgeInsets.only(
                                top: 20.0, right: 12.0, left: 12.0),
                            padding: const EdgeInsets.only(
                                top: 20, right: 3.0, left: 3.0),
                            decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.blueAccent)
                              border: Border.all(
                                  width: 2, color: Colors.blueAccent),
                              borderRadius: BorderRadius.only(

                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              ),
                            ),
                            child: ListView.builder(
                                itemCount: controller.details.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var data = controller.details[index];
                                  print(data.title);
                                  return
                                    TileList(
                                    fileUrl:// 'http://192.168.1.105:8000/workpapersFile/cc.jpg',
                                    "$link/${data.text}",
                                    title: data.title!,
                                    icone:controller.iconed
                                    // Icon(Icons
                                    //     .arrow_forward_sharp), //data.icon!,
                                  );
                                }))

                          )),
              ),
            )
          ],
        ));
  }
}

class TileList extends StatefulWidget {
  TileList(
      {super.key,
      required this.fileUrl,
      required this.title,
      required this.icone});

  final String fileUrl;
  final String title;
  final Icon icone;

  @override
  State<TileList> createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  bool dowloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String filePath;
  late CancelToken cancelToken;
  var getPathFile = DirectoryPath();
  //IconData sd = Icons.video_library;

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
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 34),
      // height: 100,
      child: Center(
          // Directionality (
          //    textDirection: TextDirection.ltr, // or TextDirection.ltr
          child: widget.fileUrl != "null"
              ? ListTile(
                  title: Text(
                    widget.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: Stack(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                  decoration: BoxDecoration(
                            color: Colors.cyan.withOpacity(0.1),
                      border: Border.all(width:3, color: Colors.blue),
                            borderRadius: BorderRadius.circular(22)),
                        child: widget.icone,
                      ),
                    ],
                  ),
                  trailing: Container(
                      height: 100,
                      width: 100,
                      child: Row(
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
                                  : dowloading
                                      ? Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircularProgressIndicator(
                                              value: progress,
                                              strokeWidth: 3,
                                              backgroundColor: Colors.grey,
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
                                          Icons.arrow_circle_down_outlined)),
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
                              const Icon(Icons.close)),
                        ],
                      )))
              :
          Container(
                  //   margin: const EdgeInsets.only(top:20.0,right:12.0,left:12.0),
                  padding: const EdgeInsets.only(
                      top: 20, right: 3.0, left: 3.0, bottom: 20),
                  child:
                  Text(
                      " $widget.title,.\n",
                      style:    TextStyle(  color: Colors.black,
                      //  fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      )
                  ),


                )),
//)
    );
  }
}


