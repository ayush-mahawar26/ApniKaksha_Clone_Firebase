// ignore_for_file: avoid_print, must_be_immutable

import 'package:apni_kaksha/Screens/Login_Register/Register/asking_info.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  String phnNumber;
  OTPScreen({Key? key, required this.phnNumber}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var poppins = GoogleFonts.poppins().fontFamily;
  String code = "";
  String finalVerificationID = "";

  final FirebaseAuth _auth = FirebaseAuth.instance;

  showMessage(String error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  phoneVerification() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: "+91 ${widget.phnNumber}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          try {
            await _auth.signInWithCredential(credential);
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AskingInfo(phnNumber: widget.phnNumber)));
          } catch (error) {
            showMessage(error.toString());
          }
        },
        verificationFailed: (FirebaseAuthException error) {
          if (error.code == 'invalid-phone-number') {
            print("verification failed - 1");
            showMessage("Invalid Phone Number Provided");
          } else {
            print("verification failed - none");
            showMessage(error.toString());
          }
        },
        codeSent: (String verificationID, int? resendtoken) {
          setState(() {
            finalVerificationID = verificationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            finalVerificationID = verificationID;
          });
        });
  }

  verifyPhoneNumber(String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: finalVerificationID, smsCode: smsCode);
      await _auth.signInWithCredential(credential);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AskingInfo(phnNumber: widget.phnNumber)));
    } catch (e) {
      showMessage("Invalid OTP entered");
    }
  }

  @override
  void initState() {
    super.initState();

    phoneVerification();
  }

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
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width.w,
                    child: OTPTextField(
                        textFieldAlignment: MainAxisAlignment.center,
                        length: 6,
                        width: MediaQuery.of(context).size.width.w,
                        fieldWidth: 40.w,
                        otpFieldStyle: OtpFieldStyle(
                            enabledBorderColor: Colors.grey,
                            focusBorderColor: Colors.pink),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontFamily: poppins,
                          fontWeight: FontWeight.w500,
                        ),
                        outlineBorderRadius: 10.r,
                        fieldStyle: FieldStyle.box,
                        onChanged: (currentCode) {
                          code = currentCode;
                        },
                        onCompleted: (val) {
                          print(val);
                        }),
                  )),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width.w,
                  child: ElevatedButton(
                      onPressed: () {
                        verifyPhoneNumber(code);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xffD63547)),
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
