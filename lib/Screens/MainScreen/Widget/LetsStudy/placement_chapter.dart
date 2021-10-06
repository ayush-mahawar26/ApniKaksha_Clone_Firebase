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
          leading: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
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
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width.w,
                  child: ListTile(
                    onTap: () {},
                    leading: Image(
                      image: const AssetImage("assets/apnikaksha.png"),
                      height: 80.h,
                      width: 80.w,
                    ),
                    title: Text(
                      "Theory Subjects - Big 4",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: poppins),
                    ),
                    trailing: Icon(CupertinoIcons.forward,
                        size: 25.sp, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
