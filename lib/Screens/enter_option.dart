// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, dead_code, avoid_print, duplicate_ignore

import 'package:apni_kaksha/Screens/Login_Register/Login/login.dart';
import 'package:apni_kaksha/Screens/Login_Register/Register/phn_number.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EnterOption extends StatelessWidget {
  const EnterOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width.w,
        height: MediaQuery.of(context).size.height.h,
        color: Color(0xff051119),
        child: optionPageLayout(context),
      ),
    );
  }
}

Widget optionPageLayout(BuildContext context) {
  var poppin = GoogleFonts.poppins().fontFamily;

  void _launchURl(String link) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      print("No cant launch");
    }
  }

  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    // ignore: prefer_const_literals_to_create_immutables
    children: [
      Image(
          height: 301.h,
          width: 360.w,
          image: AssetImage(
            "assets/apnikaksha.png",
          )),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 10.w, 0, 10.w),
        child: Text(
          "Apni Kaksha",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: poppin,
            fontSize: 20.sp,
          ),
        ),
      ),
      Container(
        width: 360.w,
        height: 280.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(33.r), topRight: Radius.circular(33.r)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.all(Radius.circular(20.r))),
                width: 50.w,
                height: 5.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: SizedBox(
                width: 309.w,
                height: 61.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffD63547))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => LoginPage()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: poppin,
                            fontSize: 20.sp),
                      ),
                    )),
              ),
            ),

            //create Account Button
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              child: SizedBox(
                width: 309.w,
                height: 61.h,
                child: ElevatedButton(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Color(0xffE84388), width: 2.w)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.r)))),
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffF6D7DA))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PhoneNumberScreen()));
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: poppin,
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp),
                      ),
                    )),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 20.h, 0, 10.h),
              child: Column(
                children: [
                  Text(
                    "By signing, you agree  our",
                    style: TextStyle(
                        color: Color(0xffA08C8C),
                        fontSize: 12.sp,
                        fontFamily: poppin,
                        fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    children: [
                      InkWell(
                        onTap: () {
                          _launchURl("https://main.apnikaksha.net/terms");
                        },
                        child: Text(
                          "Term and Condition ",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xffA08C8C),
                              fontFamily: poppin,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        " and ",
                        style: TextStyle(
                            color: Color(0xffA08C8C),
                            fontFamily: poppin,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () {
                          _launchURl("https://main.apnikaksha.net/privacy");
                        },
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xffA08C8C),
                              fontFamily: poppin,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}
