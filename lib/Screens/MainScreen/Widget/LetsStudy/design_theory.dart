// ignore_for_file: unnecessary_null_comparison
import 'package:apni_kaksha/Screens/MainScreen/Widget/lecture_play_scr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:apni_kaksha/Models/item_vedio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignTheory extends StatelessWidget {
  VedioTile item;
  DesignTheory({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  var poppins = GoogleFonts.poppins().fontFamily;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            SizedBox(
              width: 120.w,
              height: 80.h,
              child: Image(
                image: AssetImage(item.imagePath.toString()),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 180.w,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                    child: Text(
                      item.title.toString(),
                      style: TextStyle(
                        fontFamily: poppins,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => LectureVedioPlayer(item: item)));
                      },
                      icon: Icon(
                        CupertinoIcons.play_fill,
                        size: 16.sp,
                      ),
                      label: Text(
                        "Watch",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
