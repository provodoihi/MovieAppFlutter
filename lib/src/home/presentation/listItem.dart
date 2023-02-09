import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItem extends StatelessWidget {
  final String coverUrl;
  final VoidCallback? onTap;

  const ListItem({super.key, required this.coverUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.network(
        coverUrl,
        height: 200.h,
        width: 240.w,
        fit: BoxFit.cover,
      ),
    );
  }

}