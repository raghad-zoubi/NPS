import 'package:nps/core/class/statusrequest.dart';
import 'package:nps/core/constant/routes.dart';
import 'package:nps/core/function/handlingdatacontroller.dart';
import 'package:nps/data/datasource/remote/auth/verifycodsignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();

  goToSuccessSignUp(verifycode);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? email;
  VerifyCodeSignUp verifyCodeSignUp = VerifyCodeSignUp(Get.find());
  StatusRequest statusRequest=StatusRequest.non;

  @override
  checkCode() async {}

  @override
  goToSuccessSignUp(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    print("llllllllllllllllllllllllllllllllll  $email");
    var response = await verifyCodeSignUp.postVerify(
        verifycode: verifycode, email: email);
    print("=============================== Controller VerifyCodeSignUpControllerImp=> $response ");
    statusRequest = handlingData(response);
    print("$statusRequest");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        statusRequest = StatusRequest.failure;
        Get.defaultDialog(
            title: "Warning", middleText: "the verify code is not correct");
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
