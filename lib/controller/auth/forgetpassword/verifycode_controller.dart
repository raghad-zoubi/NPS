import 'package:nps/core/class/statusrequest.dart';
import 'package:nps/core/constant/routes.dart';
import 'package:nps/core/function/handlingdatacontroller.dart';
import 'package:nps/data/datasource/remote/auth/forgetpassword/verifycode.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();

  goToResetPassword(String verifycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;

  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData =
  VerifyCodeForgetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.non;

  @override
  checkCode() {}

  @override
  goToResetPassword(verifycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await verifyCodeForgetPasswordData.postdata(email!, verifycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "ُWarning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
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
