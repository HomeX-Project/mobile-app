import 'package:flutter/material.dart';
import 'package:home_x/core/util/colors.dart';
import 'package:home_x/core/util/styles.dart';

Widget CustomTextFormField({
  String? hintText,
  String? lableText,
  Icon? prefixIcon,
  Widget? suffixIcon,
  TextEditingController? controller,
  TextInputType? inputType,
  String? Function(String?)? validator,
  String? Function(String?)? onChange,
  String Function(String?)? onSaved ,
  String? Function()? suffixPressed,
  bool passwordVisible = false,
  //Function()? suffixPressed,
}) {
  return Center(
    child: TextFormField(
      //  onTap: suffixPressed,
       onSaved:onSaved ,
      onChanged: onChange,
      obscureText: passwordVisible,
      keyboardType: inputType,
      controller: controller,
      validator: validator,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },

      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFFFFFF),
        enabled: true,
       // constraints: const BoxConstraints(maxWidth: 320, maxHeight: 55),
        labelStyle: StylesApp.font14Mediam,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.primaryColors,
        suffixIconColor: AppColors.primaryColors,
        suffixIcon: suffixIcon,
        prefixStyle: StylesApp.font14Mediam,
        labelText: lableText,
      ),
    ),
  );
}
