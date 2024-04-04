import 'package:nps/core/class/crud.dart';
import 'package:nps/linkapi.dart';

class LogIn {
  Crud crud;

  LogIn(this.crud);

  logInData({required email, required password}) async {
    var response = await crud.postData(linkurl: LinkApi.login, data: {
      "email": email,
      "password": password,
    }, headers: {
      "Accept":"application/json"
    });
    return response.fold((l) => l, (r) => r);
  }
}
