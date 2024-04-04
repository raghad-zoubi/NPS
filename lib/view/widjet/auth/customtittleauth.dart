
import 'package:nps/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTittleAuth extends StatelessWidget {
    final String tittle;
  const CustomTittleAuth({required this.tittle,   Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Text(tittle,
      textAlign: TextAlign.right,

      style: TextStyle(color: AppColor.white,fontSize: 22, fontStyle:FontStyle.italic ,decorationThickness: 1)
      //Theme.of(context).textTheme.bodyMedium,

    );
  }
}
