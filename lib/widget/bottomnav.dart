import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promilo/config/color/color.dart';
import 'package:promilo/config/textstyle/text_style.dart';
import 'package:promilo/view/meetup/meetup_screen.dart';

// ignore: must_be_immutable
class Bottom extends StatefulWidget {
  int? index;
  Bottom({Key? key, this.index}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _currentIndex = 2;
  List pageData = [
    Container(),
    Container(),
    const MeetupScreen(),
    Container(),
    Container(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pageData[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: textRegular(AppColors.starcolor),
          unselectedLabelStyle: textRegular(AppColors.blackColor),
          iconSize: 20.sp,
          backgroundColor: AppColors.whiteColor,
          elevation: 10,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: AppColors.starcolor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: AppColors.greyColor),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "Prolet",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "Meetup",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
                backgroundColor: Colors.white),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
