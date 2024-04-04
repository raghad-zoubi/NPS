import 'package:nps/core/class/crud.dart';
import 'package:nps/linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);
  postData({required String name,required String email,required String password,required String phone}) async {
    var response = await crud.postData(linkurl: LinkApi.signUp,data:  {
      "name":name,
      "email":email,
      "password":password,
      "phone":phone,
    }
    ,headers: {});
    return response.fold((l) => l, (r) => r);
  }
}
