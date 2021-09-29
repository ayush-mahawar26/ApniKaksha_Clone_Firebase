// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  @override
  Widget build(BuildContext context) {
    var poppins = GoogleFonts.poppins().fontFamily;
    TextEditingController phnNumber = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 0, 0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.grey[400],
                      size: 20.sp,
                    ),
                  ),
                  Text(
                    "Back",
                    style: TextStyle(
                      fontFamily: poppins,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      color: Colors.grey[400],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: MediaQuery.of(context).size.width.w,
                child: Text(
                  "Enter Your Phone Number to receive OTP",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: poppins,
                      fontWeight: FontWeight.w600,
                      fontSize: 25.sp),
                ),
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                controller: phnNumber,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: poppins,
                    fontWeight: FontWeight.w600),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 0, 20.h),
                    fillColor: Color(0xffECEAEA),
                    filled: true,
                    hintStyle: TextStyle(
                        color: Color(0xff9F9D9D),
                        fontFamily: poppins,
                        fontSize: 16.sp),
                    hintText: "Enter Phone Number",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width.w,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r)))),
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffDF4A5B)),
                        ),
                        onPressed: () {},
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            child: Text(
                              "Send OTP",
                              style: TextStyle(
                                fontFamily: poppins,
                                fontSize: 20.sp,
                              ),
                            )))))
          ],
        ),
      ),
    );
  }
}
