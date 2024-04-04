import 'package:nps/core/class/crud.dart';
import 'package:nps/linkapi.dart';


class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);
  postdata(String email) async {
    var response = await crud.postData(linkurl: LinkApi.checkEmail,data:  {
      "email":email.toString()
    },headers: {});
    return response.fold((l) => l, (r) => r);
  }
}
