import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './onboardingItem.dart';
import './dotsIndicator.dart';
import '../../../gen/assets.gen.dart';
import '../../../common/button.dart';
import '../login/presentation/login.dart';
import '../signup/presentation/signup.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _position = 0;
  final int _pageLength = 6;
  final PageController _controller = PageController(initialPage: 0);

  void _onPageChange(int page) {
    setState(() {
      _position = page;
    });
  }

  void _onPressLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void _onPressSignup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPage(),
      ),
    );
  }

  void _onChangePage() {
    _controller.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: _onPageChange,
            children: <Widget>[
              OnboardingItem(
                asset: Assets.image.onboard1.path,
                textTitle:
                    "All your favourite MARVEL Movies & Series at one place",
              ),
              OnboardingItem(
                asset: Assets.image.onboard2.path,
                textTitle: "Watch Online \n or \n Download Offline",
              ),
              OnboardingItem(
                asset: Assets.image.onboard3.path,
                textTitle:
                    "Create profiles for different members & get personalised recommendations",
              ),
              OnboardingItem(
                asset: Assets.image.onboard4.path,
                textTitle: "Plans according to your needs at affordable prices",
              ),
              OnboardingItem(
                asset: Assets.image.onboard5.path,
                textTitle: "Let’s Get Started !!!",
              ),
              OnboardingItem(
                asset: Assets.image.onboard6.path,
                textTitle: "",
              ),
            ],
          ),
          Positioned(
            top: 390.h,
            left: 125.w,
            child: Center(
              child: DotIndicator(
                dotsCount: _pageLength,
                position: _position.toDouble(),
              ),
            ),
          ),
          _position < 5
              ? Positioned(
                  top: 646.h,
                  left: 30.w,
                  right: 30.w,
                  child: Button(
                    onPressed: _onChangePage,
                    textButton: 'Continue',
                    isOutlined: false,
                  ),
                )
              : Positioned(
                  top: 471.h,
                  left: 30.w,
                  right: 30.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Button(
                        onPressed: _onPressSignup,
                        textButton: 'Signup',
                        isOutlined: false,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 32.h),
                        child: Button(
                          onPressed: _onPressLogin,
                          textButton: 'Login',
                          isOutlined: true,
                        ),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
