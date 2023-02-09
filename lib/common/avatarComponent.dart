import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Avatar extends StatelessWidget {
  final VoidCallback onPressed;
  final String asset;
  final bool? isSelected;
  final double scale;

  const Avatar({
    super.key,
    required this.onPressed,
    required this.asset,
    this.isSelected = false,
    this.scale = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        padding: EdgeInsets.zero,
        side: isSelected == true
            ? const BorderSide(
                width: 1,
                color: Colors.blue,
              )
            : null,
      ),
      child: Image.asset(
        asset,
        height: 100.w * scale,
        width: 100.h * scale,
        fit: BoxFit.contain,
      ),
    );
  }
}
