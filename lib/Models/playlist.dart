// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';

class PlayList {
  var poppins = GoogleFonts.poppins().fontFamily;

  Widget playlistItem(String title, BuildContext context, String path) {
    return SizedBox(
      width: MediaQuery.of(context).size.width.w / 3,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.r))),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child:
                CircleAvatar(radius: 60.r, backgroundImage: AssetImage(path)),
          ),
          SizedBox(
            height: 20.h,
            width: 90.w,
            child: Marquee(
              text: "  ${title}  ",
              style: TextStyle(
                  color: const Color(0xff021331),
                  fontWeight: FontWeight.w700,
                  fontSize: 13.sp,
                  fontFamily: poppins),

              crossAxisAlignment: CrossAxisAlignment.start,
              velocity: 30.0,
              pauseAfterRound: const Duration(seconds: 1),
              // startPadding: 10.0,
              // accelerationDuration: const Duration(seconds: 1),
              // accelerationCurve: Curves.linear,
              // decelerationDuration: const Duration(milliseconds: 500),
              // decelerationCurve: Curves.easeOut,
            ),
          )
        ]),
      ),
    );
  }
}
