import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/avatarComponent.dart';
import 'package:movie_app/src/home/presentation/downloadScreen.dart';
import 'package:movie_app/src/home/presentation/homeListScreen.dart';
import '../../authentication/login/presentation/login.dart';

import '../../../gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onPressAvatar() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void _onTapItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _page = [
    const HomeList(),
    const DownloadScreen(),
    const DownloadScreen(),
    const DownloadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Image.asset(
          Assets.image.marvelLogo.path,
          height: 44.h,
          width: 100.w,
          fit: BoxFit.contain,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Avatar(
              onPressed: _onPressAvatar,
              asset: Assets.image.avatar1.path,
              scale: 0.4,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0.7),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_download_outlined),
            label: 'Download',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            label: 'More',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: _onTapItem,
      ),
      body: _page[_currentIndex],
    );
  }
}
