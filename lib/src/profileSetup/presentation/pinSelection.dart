import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/avatarComponent.dart';
import 'package:movie_app/common/button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'userConfirm.dart';

import '../../../gen/assets.gen.dart';

class PinSelection extends StatefulWidget {
  const PinSelection({super.key});

  @override
  State<StatefulWidget> createState() => _PinSelectionState();
}

class _PinSelectionState extends State<PinSelection> {
  final TextEditingController _pin = TextEditingController();
  bool _isFillOtp = false;

  void _onChange(String value) {
    if (value.length == 4) {
      setState(() {
        _isFillOtp = true;
      });
    }
  }

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserConfirm(),
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
                padding: EdgeInsets.fromLTRB(0, 28.h, 0, 48.h),
                child: Text(
                  'Create a Pin',
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
                child: Avatar(
                  onPressed: () {},
                  scale: 1.2,
                  asset: Assets.image.avatar1.path,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 64.w),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(15),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  inactiveColor: const Color.fromRGBO(255, 255, 255, 0.2),
                  activeColor: const Color.fromRGBO(255, 255, 255, 0.2),
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 100),
                controller: _pin,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  _onChange(value);
                },
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 20.h),
                child: Text(
                  'This pin will be used to \n log-in to your profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color.fromRGBO(255, 255, 255, 0.5),
                    fontSize: 16.sp,
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
                      onPressed: _isFillOtp == true ? _onContinue : () {},
                      textButton: 'I’m all safe now',
                      isOutlined: _isFillOtp == true ? false : true,
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
