import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/avatarComponent.dart';
import 'package:movie_app/common/button.dart';

import '../../../gen/assets.gen.dart';

class UserConfirm extends StatefulWidget {
  const UserConfirm({super.key});

  @override
  State<StatefulWidget> createState() => _UserConfirmState();
}

class _UserConfirmState extends State<UserConfirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Image.asset(
                Assets.image.marvelLogo.path,
                height: 85.h,
                width: 188.w,
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(40.w, 20.h, 40.w, 48.h),
                child: Text(
                  'Your Profile is Created Successfully!!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 24.h),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Avatar(
                      onPressed: () {},
                      scale: 2,
                      asset: Assets.image.avatar1.path,
                    ),
                    Image.asset(
                      Assets.image.avatarOutline.path,
                      height: 260.w,
                      width: 260.h,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 64.w),
                child: Text(
                  'USERNAME HERE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: Button(
                      onPressed: () {},
                      textButton: 'I’m all safe now',
                      isOutlined: false,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
