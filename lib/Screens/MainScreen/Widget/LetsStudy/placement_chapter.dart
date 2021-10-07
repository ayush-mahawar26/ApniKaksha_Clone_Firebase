// ignore_for_file: must_be_immutable

import 'package:apni_kaksha/Screens/MainScreen/Widget/LetsStudy/theory_vedio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlacementChapter extends StatelessWidget {
  PlacementChapter({Key? key}) : super(key: key);

  var poppins = GoogleFonts.poppins().fontFamily;
  Color blacktype = const Color(0xff051119);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: blacktype,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp)),
          title: Image(
            image: const AssetImage("assets/apnikaksha.png"),
            height: 50.h,
            width: 50.h,
          ),
          centerTitle: true,
          toolbarHeight: 50.h,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Chapter",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontFamily: poppins,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10.h,
              ),
              cardForLecture(context, "Theory Subject - Big 4", () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const TheoryLecture()));
              })
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardForLecture(
  BuildContext context,
  String title,
  Function toPerform,
) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.r)),
    ),
    child: SizedBox(
      width: MediaQuery.of(context).size.width.w,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        child: ListTile(
          onTap: () {
            toPerform();
          },
          leading: Image(
            image: const AssetImage("assets/apnikaksha.png"),
            height: 80.h,
            width: 80.w,
          ),
          title: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(CupertinoIcons.forward, size: 25.sp, color: Colors.black),
            ],
          ),
        ),
      ),
    ),
  );
}
