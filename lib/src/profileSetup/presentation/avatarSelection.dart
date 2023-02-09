import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/avatarComponent.dart';
import 'package:movie_app/common/button.dart';
import 'usernameSelection.dart';

import '../../../gen/assets.gen.dart';

class AvatarSelection extends StatefulWidget {
  const AvatarSelection({super.key});

  @override
  State<StatefulWidget> createState() => _AvatarSelectionState();
}

class _AvatarSelectionState extends State<AvatarSelection> {
  int _avatarSelected = 0;

  void _onPressAvatar(int item) {
    setState(() {
      _avatarSelected = item;
    });
  }

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UsernameSelection(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Image.asset(
                  Assets.image.marvelLogo.path,
                  height: 85.h,
                  width: 188.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Text(
                  'Choose Your Avatar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Avatar(
                    onPressed: () => _onPressAvatar(1),
                    asset: Assets.image.avatar1.path,
                    isSelected: _avatarSelected == 1,
                  ),
                  Avatar(
                    onPressed: () => _onPressAvatar(2),
                    asset: Assets.image.avatar2.path,
                    isSelected: _avatarSelected == 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Avatar(
                    onPressed: () => _onPressAvatar(3),
                    asset: Assets.image.avatar3.path,
                    isSelected: _avatarSelected == 3,
                  ),
                  Avatar(
                    onPressed: () => _onPressAvatar(4),
                    asset: Assets.image.avatar4.path,
                    isSelected: _avatarSelected == 4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Avatar(
                    onPressed: () => _onPressAvatar(5),
                    asset: Assets.image.avatar5.path,
                    isSelected: _avatarSelected == 5,
                  ),
                  Avatar(
                    onPressed: () => _onPressAvatar(6),
                    asset: Assets.image.avatar6.path,
                    isSelected: _avatarSelected == 6,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Avatar(
                    onPressed: () => _onPressAvatar(7),
                    asset: Assets.image.avatar7.path,
                    isSelected: _avatarSelected == 7,
                  ),
                  Avatar(
                    onPressed: () => _onPressAvatar(8),
                    asset: Assets.image.avatar8.path,
                    isSelected: _avatarSelected == 8,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 10.h),
              child: Button(
                onPressed: _avatarSelected != 0 ? _onContinue : () {},
                textButton: 'Looks Good',
                isOutlined: _avatarSelected == 0 ? true : false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
