
import 'package:nps/core/class/crud.dart';
import 'package:nps/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);
  postdata(String email ,String password) async {
    var response = await crud.postData(linkurl: LinkApi.resetPassword,data:  {
      "email" : email , 
      "password" : password   
    },headers: {});
    return response.fold((l) => l, (r) => r);
  }
}
