import 'package:nps/core/constant/imgaeasset.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomLogoAuth2 extends StatelessWidget {
  const CustomLogoAuth2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      CircleAvatar(
      radius: 200.0,
      backgroundImage: AssetImage(AppImageAsset.logoMakgzan),
    );
    //   CircleAvatar(
    //
    //   child: ClipOval(
    //     child: Image.asset(AppImageAsset.logoMakgzan),
    //   ),
    //   radius: 100,
    //   backgroundColor: AppColor.secondColor,
    // );
    // //;
  }
}
