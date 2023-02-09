import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/avatarComponent.dart';
import 'package:movie_app/common/button.dart';
import 'package:movie_app/src/profileSetup/presentation/customInput.dart';
import 'passwordConfirm.dart';

import '../../../gen/assets.gen.dart';

class UsernameSelection extends StatefulWidget {
  const UsernameSelection({super.key});

  @override
  State<StatefulWidget> createState() => _UsernameSelectionState();
}

class _UsernameSelectionState extends State<UsernameSelection> {
  final TextEditingController _username = TextEditingController();
  String? _errorText = '';

  void _onChange() {
    if (_username.text != "") {
      setState(() {
        _errorText = 'Username is available';
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
        builder: (context) => const PasswordSelection(),
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
                  'Enter your Username',
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
                controller: _username,
                onChanged: _onChange,
                hasErrorText: true,
                errorText: _errorText,
                hintText: 'Username',
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
                      onPressed: _username.text != "" ? _onContinue : () {},
                      textButton: 'Call me this',
                      isOutlined: _username.text != "" ? false : true,
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
