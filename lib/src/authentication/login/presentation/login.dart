import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/login_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../common/index.dart';
import '../../signup/presentation/signup.dart';
import '../../../home/presentation/homeScreen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<StatefulWidget> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool _isNull = true;
  bool _isVisible = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose(); //prevents memory leak
  }

  void _checkNull() {
    if (_password.text != "" && _username.text != "") {
      setState(() {
        _isNull = false;
      });
    } else {
      setState(() {
        _isNull = true;
      });
    }
  }

  void _setVisible() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _onPressSignup() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPage(),
      ),
    );
  }

  void _onPressLogin() {
    context.read<LoginBloc>().add(LoginPressed(_username.text, _password.text));
  }

  void _onPressTest() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          } else if (state is LoginFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 44.h),
                          child: Image.asset(
                            Assets.image.marvelLogo.path,
                            height: 85.h,
                            width: 188.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      TextInput(
                        controller: _username,
                        onChanged: _checkNull,
                        hintText: 'Enter your Email ID',
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: TextInput(
                          controller: _password,
                          onChanged: _checkNull,
                          hintText: 'Password',
                          obscureText: _isVisible,
                          hasSuffix: true,
                          suffix: TextButton(
                            onPressed: _setVisible,
                            child: Text(
                              _isVisible == true ? 'Show' : 'Hide',
                              style: TextStyle(
                                color: const Color.fromRGBO(0, 0, 0, 0.7),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 24.h, 0, 12.h),
                        child: Button(
                          onPressed: _isNull == true ? () => {} : _onPressLogin,
                          textButton: 'Login',
                          isOutlined: _isNull,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: _onPressTest,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.7),
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 24.sp),
                        child: Center(
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: const Color.fromRGBO(255, 255, 255, 0.5),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24.h),
                        child: Center(
                          child: Text(
                            'Continue With',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialLoginButton(
                            onPressed: () => {},
                            type: SocialType.facebook,
                          ),
                          SocialLoginButton(
                            onPressed: () => {},
                            type: SocialType.google,
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Center(
                          child: TextButton(
                            onPressed: _onPressSignup,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don’t have an account? ',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.5),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'Signup',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
