import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/signup_bloc.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../common/index.dart';
import '../../login/presentation/login.dart';
import '../../../profileSetup/presentation/avatarSelection.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupBloc(),
      child: const SignupBody(),
    );
  }
}

class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<StatefulWidget> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  bool _isNull = true;
  bool _isVisible = true;
  String? _errorTextUsername;
  String? _errorTextPassword;
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
        _errorTextPassword = '';
        _errorTextUsername = '';
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

  void _onPressLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void _onPressTest() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const AvatarSelection(),
      ),
    );
  }

  void _onPressSignup() {
    final bool isValidMail = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_username.text);
    final bool isValidPassword = _password.text.length >= 6;
    if (isValidMail && isValidPassword) {
      context
          .read<SignupBloc>()
          .add(SignupPressed(_username.text, _password.text));
    } else {
      if (isValidMail == false) {
        setState(() {
          _errorTextUsername = 'Invalid Email';
        });
      }
      if (isValidPassword == false) {
        setState(() {
          _errorTextPassword = 'Invalid Password';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is SignupSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Signup success"),
              ),
            );
          } else if (state is SignupFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(
          builder: (context, state) {
            if (state is SignupLoading) {
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
                        errorText: _errorTextUsername,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12.h),
                        child: TextInput(
                          controller: _password,
                          onChanged: _checkNull,
                          hintText: 'Password',
                          errorText: _errorTextPassword,
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
                          onPressed: _isNull ? () => {} : _onPressSignup,
                          textButton: 'Signup',
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
                        padding: EdgeInsets.only(top: 20.h),
                        child: Center(
                          child: TextButton(
                            onPressed: _onPressLogin,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(
                                        255, 255, 255, 0.5),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'Login',
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
