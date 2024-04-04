import 'package:nps/core/class/crud.dart';
import 'package:nps/linkapi.dart';
class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);
  postdata(String email ,String verifycode) async {
    var response = await crud.postData(linkurl: LinkApi.verifycodeforgetpassword,data:  {
      "email" : email ,
      "verifycode" : verifycode   
    },headers: {

    });
    return response.fold((l) => l, (r) => r);
  }
}
