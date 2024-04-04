import 'package:nps/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hint;
  final TextEditingController textEditingController;
  final String label;
  final bool isNumber;
  final Icon icon;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final String? Function(String?)? validator;

  const CustomTextFormAuth(
      {Key? key,
      this.onTapIcon,
      this.obscureText,
      required this.isNumber,
      required this.validator,
      required this.hint,
      required this.icon,
      required this.label,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      obscureText: obscureText==null || obscureText==false ?false : true ,
      controller: textEditingController,
      keyboardType: isNumber
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      validator: validator,
      decoration: InputDecoration(
          fillColor: AppColor.white,
          focusColor: AppColor.white,

          border: InputBorder.none,
          hintText: '********',
          filled: true,

          hintStyle: const TextStyle(fontSize: 22,color: AppColor.blue_absance),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20, horizontal: 30),

         // suffixIcon: InkWell(onTap: onTapIcon, child: icon,highlightColor: AppColor.blue_absance),
          label: Container(

              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text(label,style: TextStyle(color: AppColor.blue_absance,fontSize: 22),)),
      //    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),)
    ),
    );
  }
}
