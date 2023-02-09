import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/src/authentication/data/userCredentialModel.dart';
import 'package:movie_app/src/authentication/onboarding/onboarding.dart';

void main() async {
  Hive.registerAdapter(UserCredentialAdapter());
  await Hive.initFlutter();
  await Hive.openBox('SignupCredential');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Movie App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2021.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const OnboardingPage(),
    );
  }
}
