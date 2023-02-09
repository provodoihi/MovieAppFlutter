import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../gen/assets.gen.dart';

enum SocialType {
  facebook,
  google,
}

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final SocialType type;

  const SocialLoginButton({
    super.key,
    required this.onPressed,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: 5.h,
            horizontal: 4.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              type.name == 'facebook'
                  ? Assets.image.facebookLogo.path
                  : Assets.image.googleLogo.path,
              height: 40.w,
              width: 40.w,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4.w),
              child: Text(
                type.name == 'facebook' ? 'Facebook' : 'Google',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
