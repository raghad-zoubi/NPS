import 'package:nps/core/class/statusrequest.dart';

handlingData(response){
  if (response is StatusRequest){
    return response ;
  }else {//map type
    return StatusRequest.success ;
  }
}