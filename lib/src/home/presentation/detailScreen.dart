import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/index.dart';

import '../../../gen/assets.gen.dart';

class DetailScreen extends StatelessWidget {
  final String coverUrl;
  final String name;
  final String description;

  const DetailScreen({
    super.key,
    required this.coverUrl,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.only(top: 0),
        children: [
          Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    coverUrl,
                    height: 480.h,
                    width: 360.w,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150.w,
                          child: Button(
                            onPressed: () {},
                            textButton: 'Download',
                            isOutlined: true,
                          ),
                        ),
                        Text(
                          '+Add to Watchlist',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    child: Text(
                      description,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40.h,
                left: 12.w,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 60.h,
                left: 60.w,
                right: 60.w,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Positioned(
                top: 350.h,
                left: 140.h,
                right: 140.h,
                child: Image.asset(
                  Assets.image.arrowCircleRight.path,
                  height: 80.h,
                  width: 80.w,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
