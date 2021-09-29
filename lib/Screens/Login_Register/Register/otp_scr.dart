// ignore_for_file: must_be_immutable, avoid_print, prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatefulWidget {
  String phnNumber;
  OTPScreen({Key? key, required this.phnNumber}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var poppins = GoogleFonts.poppins().fontFamily;
  String smsCode = "";
  String finalVerificationID = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width.w,
          height: MediaQuery.of(context).size.height.h,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 10.h, 0, 10.h),
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.grey[400],
                      ),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: poppins,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width.w,
                  child: Text(
                    "OTP has been sent successfully to ${widget.phnNumber.substring(6)}",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: poppins,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: OtpTextField(
                  numberOfFields: 6,
                  showFieldAsBox: true,
                  textStyle: TextStyle(fontSize: 16.sp),
                  fieldWidth: 40.w,
                  focusedBorderColor: const Color(0xffD63547),
                  enabledBorderColor: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  onCodeChanged: (code) {
                    smsCode = code;
                  },
                  onSubmit: (val) {
                    print(val);
                  },
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width.w,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xffD63547)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.r))))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        child: Text(
                          "Verify OTP",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: poppins,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
