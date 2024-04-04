class LinkApi {
  static const String server = "http://192.168.1.105:8000";
  static const String mokServer = "https://c604b723-6dcd-43b5-83ca-40449b24d24d.mock.pstmn.io";
//  192.168.1.105
  static const String test = "$server/test.php";
  //========================== Image ============================
  static const String imagestCategories = "$server/categories/";
  static const String imagestItems = "$server/items/";

  //================================auth------------------------

  static const String signUp = "$server/api/auth/signup";
  static const String login = "$server/api/auth/login";
  static const String activeEmail = "$server/api/auth/ActiveEmail";
  static const String checkEmail = "$server/api/auth/checkEmail";

  //=================================forget password==============================================

  static const String resetPassword = "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword = "$server/forgetpassword/verifycode.php";
  static const String getDataHomePage = "$server/api/auth/checkEmail";

  //===================================home============================================

  static const String homepage = "$mokServer/api/auth/index"  ;
  static const String program = "$mokServer/api/student/program"  ;





}
