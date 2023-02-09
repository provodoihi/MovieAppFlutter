import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../gen/assets.gen.dart';

class OnboardingItem extends StatelessWidget {
  final String asset;
  final String textTitle;

  const OnboardingItem(
      {super.key, required this.asset, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          asset,
          height: 600.h,
          width: 360.w,
          fit: BoxFit.contain,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 243.h),
                child: Image.asset(
                  Assets.image.marvelLogo.path,
                  height: 85.h,
                  width: 188.w,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(55.w, 130.h, 55.w, 0),
                child: Text(
                  textTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
