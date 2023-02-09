import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final Function onChanged;
  final String? hintText;
  final String? errorText;
  final bool? hasErrorText;
  final bool obscureText;

  const CustomInput({
    super.key,
    required this.controller,
    required this.onChanged,
    this.errorText,
    this.hintText,
    this.hasErrorText = false,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (text) {
        onChanged();
      },
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w800,
      ),
      cursorColor: Colors.white,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 0.2),
        border: InputBorder.none,
        hintText: hintText,
        errorText: hasErrorText == true ? errorText : null,
        hintStyle: TextStyle(
          color: const Color.fromRGBO(255, 255, 255, 0.3),
          fontSize: 18.sp,
          fontWeight: FontWeight.w800,
        ),
        errorStyle: TextStyle(
          color: Colors.green,
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
        ),
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }
}
