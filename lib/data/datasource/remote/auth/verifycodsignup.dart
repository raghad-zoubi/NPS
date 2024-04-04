import 'package:nps/core/class/crud.dart';
import 'package:nps/linkapi.dart';

class VerifyCodeSignUp {
  Crud crud;

  VerifyCodeSignUp(this.crud);

  postVerify({required verifycode,required email}) async {
    print("llllllllllllllllllllllllllllllllll  $email");
    var response = await crud.postData(
        linkurl: LinkApi.activeEmail,
        data: {"code": verifycode.toString(), "email": email},
        headers: {});
    return response.fold((l) => l, (r) => r);
  }
}
