// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LetStudy extends StatefulWidget {
  const LetStudy({Key? key}) : super(key: key);

  @override
  _LetStudyState createState() => _LetStudyState();
}

class _LetStudyState extends State<LetStudy> {
  var poppins = GoogleFonts.poppins().fontFamily;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Let's Study",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w900,
                  fontFamily: poppins),
            ),
            SizedBox(
              height: 10.h,
            ),
            cardTopic("Coding", "assets/code.jpg", context),
            cardTopic("Jee", "assets/jee.jpg", context),
            cardTopic("Boards XII", "assets/boards.jpg", context),
          ],
        ),
      ),
    );
  }
}

Widget cardTopic(String title, String imagePath, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: InkWell(
      onTap: () {
        print(title);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width.w,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          clipBehavior: Clip.antiAlias,
          child: Stack(alignment: Alignment.bottomLeft, children: [
            Image(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600),
              ),
            )
          ]),
        ),
      ),
    ),
  );
}
