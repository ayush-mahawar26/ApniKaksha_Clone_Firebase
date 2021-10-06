// ignore_for_file: prefer_const_constructors

import 'package:apni_kaksha/Screens/MainScreen/Widget/BottomAppBar%20Screen/download.dart';
import 'package:apni_kaksha/Screens/MainScreen/Widget/BottomAppBar%20Screen/help.dart';
import 'package:apni_kaksha/Screens/MainScreen/Widget/BottomAppBar%20Screen/home_screen.dart';
import 'package:apni_kaksha/Screens/MainScreen/Widget/BottomAppBar%20Screen/let_study.dart';
import 'package:apni_kaksha/Screens/MainScreen/Widget/BottomAppBar%20Screen/my_zone.dart';
import 'package:apni_kaksha/Screens/MainScreen/Widget/drawer.dart';
import 'package:apni_kaksha/Screens/MainScreen/category_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavigationBarItem bottomItem(Icon icon, String title) {
    return BottomNavigationBarItem(
        icon: icon, label: title, backgroundColor: Colors.white);
  }

  var poppins = GoogleFonts.poppins().fontFamily;
  int currentPageIndex = 0;
  final List<Widget> _screens = <Widget>[
    HomePage(),
    LetStudy(),
    Download(),
    MyZone(),
    HelpPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerWidget().drawer(context),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(fontFamily: poppins),
          selectedFontSize: 13.sp,
          unselectedFontSize: 12.sp,
          items: [
            bottomItem(Icon(CupertinoIcons.home), "Home"),
            bottomItem(Icon(CupertinoIcons.play_circle_fill), "Let's Study"),
            bottomItem(Icon(Icons.file_download_outlined), "Download"),
            bottomItem(Icon(CupertinoIcons.folder_solid), "My Zone"),
            bottomItem(Icon(CupertinoIcons.question_square_fill), "Help"),
          ],
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          iconSize: 25.sp,
          currentIndex: currentPageIndex,
          unselectedLabelStyle:
              TextStyle(color: Colors.grey, fontFamily: poppins),
          onTap: (index) {
            setState(() {
              currentPageIndex = index;
            });
          },
        ),
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),

          actions: [
            InkWell(
              child: Icon(
                CupertinoIcons.bell,
                size: 20.sp,
              ),
            ),
            SizedBox(
              width: 20.w,
            )
          ],
          // Take to the Caterogy page
          title: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Category()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width.w * 0.5,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Categories",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: poppins,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 20.sp,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: _screens.elementAt(currentPageIndex),
      ),
    );
  }
}
