import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming soon',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    );
  }

}