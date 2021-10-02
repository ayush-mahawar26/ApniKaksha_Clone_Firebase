// ignore_for_file: prefer_const_constructors

import 'package:apni_kaksha/Screens/Login_Register/Register/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  _PhoneNumberScreenState createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  var poppins = GoogleFonts.poppins().fontFamily;
  var phnNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 0),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.grey[400],
                    size: 20.sp,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  "Back",
                  style: TextStyle(
                      color: Colors.grey[350],
                      fontSize: 20.sp,
                      fontFamily: poppins,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Enter Your Phone Number to receive OTP",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: poppins,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20.h),
            TextFormField(
                controller: phnNumber,
                keyboardType: TextInputType.phone,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 16.sp),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 16.sp),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.fromLTRB(16.w, 10.h, 0, 10.h),
                    hintText: "Enter Phone Number",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                        borderSide: BorderSide.none))),
            SizedBox(
              height: 35.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width.w,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffD63547)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))))),
                  onPressed: () {
                    if (phnNumber.text.isNotEmpty &&
                        phnNumber.text.length == 10) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              OTPScreen(phnNumber: phnNumber.text)));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid Phone Number ")));
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Text(
                      "Send OTP",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: poppins,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
            )
          ],
        ),
      )),
    );
  }
}
