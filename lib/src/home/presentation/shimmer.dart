import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade500,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
            ),
            Container(
              height: 30.h,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
            ),
            Container(
              height: 120.h,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
            ),
            Container(
              height: 30.h,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
            ),
            Container(
              height: 120.h,
              width: double.infinity,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.h),
            ),
            Container(
              height: 120.h,
              width: double.infinity,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

}