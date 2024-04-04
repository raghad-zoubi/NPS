
import 'dart:developer';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:pusher_client/pusher_client.dart';

import '../core/services/services.dart';
import 'NotificationApi.dart';



class SingltoneNotification  extends GetxController{

  static final SingltoneNotification _SingltonePusher =
  SingltoneNotification._internal();

  factory SingltoneNotification() {
    return _SingltonePusher;
  }
  //var sender_id=''.obs;
  SingltoneNotification._internal();
  PusherClient? pusher;
  Channel? channel;



  initPusher() {
    PusherOptions options = PusherOptions(
      cluster: "eu",
    );

    pusher = PusherClient("5b04b31e2192dc23e7c0", options,
      enableLogging: true, autoConnect: false,
    );
  }


  void subscribePusher() {

    channel = pusher!.subscribe("public-channel.$id");
    pusher!.onConnectionStateChange((state) {
      log("previousState: ${state!.previousState}, currentState: ${state.currentState}");
    });
    pusher!.onConnectionError((error) {
      log("error: ${error!.message}");
    });
    channel!.bind("NotificationEvent", (last) {
      final data = json.decode(last!.data.toString());
      // if(data["message"]!='chat' && data["title"]!='title')
      NotificationApi.showNotification(id:data['user_id'] ,body:data['message'],title:data['title'] );
      //  else {
      //controller.i.value++;
      // }
      if (last.data != null) {

        print(data["message"]);
        print(data["title"]);
        //print(controller.i.value);



      }
    });


  }

  void connectPusher() {
    pusher!.connect();
  }

  void disconnectPusher() async {
    await channel!.unbind("NotificationEvent");
    //   await pusher!.disconnect();
  }


  inti() async {


    //sender_id.value=(await storage.read(key: 'id'))!;

    print("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
    SingltoneNotification().initPusher();
    SingltoneNotification().connectPusher();
    SingltoneNotification().subscribePusher();
  }
  MyServices myServices = Get.find();
  String id='1';
  @override
  void onInit() {
    id = myServices.sharedPreferences.getString("id")!;
    update();
    inti();

  }



}













