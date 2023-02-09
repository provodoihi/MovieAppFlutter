import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInput extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final bool obscureText;
  final String? label;
  final String? hintText;
  final String? errorText;
  final bool? hasSuffix;
  final Widget? suffix;

  const TextInput({
    super.key,
    required this.controller,
    this.obscureText = false,
    this.label,
    this.hintText,
    this.errorText,
    required this.onChanged,
    this.hasSuffix = false,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (text) {
        onChanged();
      },
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
      ),
      obscureText: obscureText,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        errorText: errorText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFF979797),
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0XFF979797),
            width: 1,
          ),
        ),
        hintStyle: TextStyle(
          color: const Color.fromRGBO(0, 0, 0, 0.5),
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        errorStyle: TextStyle(
          color: Colors.red,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
        contentPadding: EdgeInsets.only(left: 12.w),
        suffix: hasSuffix == true ? suffix : null,
      ),
    );
  }
}
