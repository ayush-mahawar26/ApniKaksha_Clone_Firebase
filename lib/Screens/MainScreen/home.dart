// ignore_for_file: prefer_const_constructors

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
  var poppins = GoogleFonts.poppins().fontFamily;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60.h,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,

          // Take to the Caterogy page
          title: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Category()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width.w / 1.5,
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
                      CupertinoIcons.chevron_down_circle,
                      size: 16.sp,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
