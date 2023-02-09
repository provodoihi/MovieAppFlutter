import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String textButton;
  final bool isOutlined;

  const Button({
    super.key,
    required this.onPressed,
    required this.textButton,
    required this.isOutlined,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: isOutlined == true ? Colors.black : Colors.red,
        padding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 0,
        ),
        side: isOutlined == true
            ? const BorderSide(
                width: 2,
                color: Colors.red,
              )
            : null,
      ),
      child: Text(
        textButton,
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
