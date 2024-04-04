import 'package:nps/controller/auth/signup_controller.dart';
import 'package:nps/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>  SignUpControllerImp(),fenix: true);
    Get.lazyPut(() =>  Crud(),fenix: true);
  }


}