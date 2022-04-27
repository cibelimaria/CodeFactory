import 'package:code_factory/screens/courses_screen.dart';
import 'package:code_factory/screens/profile_screen.dart';
import 'package:code_factory/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentIndex = 0;
  final screens = [
    const CoursesScreen(),
    const Profile(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _body(),
      bottomNavigationBar: _bottomNavigatorBar(),
    );
  }

  Widget _body() {
    return IndexedStack(
      index: currentIndex,
      children: screens,
    );
  }

  Widget _bottomNavigatorBar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
      child: Container(
        height: 98,
        decoration: _boxDecoration(),
        child: ClipRRect(
          child: _bottomNavigator(),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFBEBAB3)),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)));
  }

  Widget _bottomNavigator() {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconSize: 36,
      selectedItemColor: const Color(0xFFe3562a),
      unselectedItemColor: const Color(0xFFBEBAB3),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        _iconNavigatorBar('assets/icons/courses_icon.svg', 0, 'Courses'),
        _iconNavigatorBar('assets/icons/profile_icon.svg', 1, 'Profile'),
        _iconNavigatorBar('assets/icons/settings_icon.svg', 2, 'Settings'),
      ],
    );
  }

  BottomNavigationBarItem _iconNavigatorBar(
    String icon,
    int page,
    String label,
  ) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          icon,
          height: 40,
          color: currentIndex == page
              ? const Color(0xFFe3562a)
              : const Color(0xFFBEBAB3),
        ),
        label: label);
  }
}
