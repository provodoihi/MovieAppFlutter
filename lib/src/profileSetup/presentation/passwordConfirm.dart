import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/avatarComponent.dart';
import 'package:movie_app/common/button.dart';
import 'package:movie_app/src/profileSetup/presentation/customInput.dart';
import 'pinSelection.dart';

import '../../../gen/assets.gen.dart';

class PasswordSelection extends StatefulWidget {
  const PasswordSelection({super.key});

  @override
  State<StatefulWidget> createState() => _PasswordSelectionState();
}

class _PasswordSelectionState extends State<PasswordSelection> {
  final TextEditingController _password = TextEditingController();
  String? _errorText = '';

  void _onChange() {
    if (_password.text.length >= 6) {
      setState(() {
        _errorText = 'Minimum 6 characters';
      });
    } else {
      setState(() {
        _errorText = '';
      });
    }
  }

  void _onContinue() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PinSelection(),
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
                  'Confirm your password',
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
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: CustomInput(
                controller: _password,
                onChanged: _onChange,
                hasErrorText: true,
                errorText: _errorText,
                hintText: 'Password',
                obscureText: true,
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
                      onPressed: _password.text.length >= 6 ? _onContinue : () {},
                      textButton: 'Looks Strong',
                      isOutlined: _password.text.length >= 6 ? false : true,
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
