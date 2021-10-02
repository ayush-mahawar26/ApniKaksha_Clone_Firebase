// ignore_for_file: prefer_const_constructors,, unnecessary_null_comparison

import 'package:apni_kaksha/Screens/Services/auth_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  AuthService authService = AuthService();

  bool isSecure = true;
  Icon currentIcon = Icon(
    CupertinoIcons.eye_fill,
    color: Colors.grey,
    size: 20.sp,
  );

  void _toggleView() {
    setState(() {
      if (isSecure) {
        isSecure = false;
        currentIcon = Icon(
          CupertinoIcons.eye_slash_fill,
          color: Colors.grey,
          size: 20.sp,
        );
      } else {
        isSecure = true;
        currentIcon = Icon(
          CupertinoIcons.eye_fill,
          color: Colors.grey,
          size: 20.sp,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width.w,
      height: MediaQuery.of(context).size.height.h,
      child: Stack(
        children: [
          Image(
            image: AssetImage(
              "assets/login_img.jpg",
            ),
            fit: BoxFit.cover,
            width: 360.w,
            height: 450.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: MediaQuery.of(context).size.width.w,
                height: 345.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(33.r),
                        topRight: Radius.circular(33.r))),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          child: Container(
                              width: 50.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(20.r))))),
                      Column(
                        children: [
                          labelText("E - Mail Address / Phone Number",
                              Icon(CupertinoIcons.phone_fill)),
                          entryBox("E - Mail Address / Phone Number", email),
                        ],
                      ),

                      // Widget For Password (entry Box)
                      Column(
                        children: [
                          labelText("Password", Icon(CupertinoIcons.lock_fill)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: TextFormField(
                                controller: password,
                                obscureText: isSecure,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 16.sp),
                                decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      onTap: () {
                                        _toggleView();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 16.w),
                                        child: currentIcon,
                                      ),
                                    ),
                                    hintStyle: TextStyle(fontSize: 16.sp),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        16.w, 10.h, 0, 10.h),
                                    hintText: "Password",
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        borderSide: BorderSide(
                                            color: Colors.grey, width: 2)))),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          forgetItemWidget(),
                        ],
                      ),

                      // SizedBox(
                      //   height: 20,
                      // ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 12.h),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width.w,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xffD63547)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.r))))),
                              onPressed: () {
                                if (email.text == null || email.text.isEmpty) {
                                  authService.showToast(
                                      "Enter Email Adrress / Phone Number");
                                } else if (password.text.isEmpty ||
                                    password.text == null) {
                                  authService.showToast("Enter Password");
                                } else {
                                  authService.signInwithEmailAndPassword(
                                      context, email.text, password.text);
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.sp),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}

Widget forgetItemWidget() {
  return Padding(
    padding: EdgeInsets.only(left: 30.w),
    child: Row(
      children: [
        Text(
          "Forget Password? ",
          style: TextStyle(
              color: Colors.black,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: () {},
          child: Text(
            "Reset",
            style: TextStyle(
                color: Color(0xffD63547),
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    ),
  );
}

Widget entryBox(String hint, TextEditingController controller) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 30.w),
    child: TextFormField(
        controller: controller,
        style: TextStyle(
            color: Colors.black,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 16.sp),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 16.sp),
            contentPadding: EdgeInsets.fromLTRB(16.w, 10.h, 0, 10.h),
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(color: Colors.grey, width: 2)))),
  );
}

Widget labelText(
  String label,
  Icon icon,
) {
  return Padding(
    padding: EdgeInsets.fromLTRB(30.w, 5.h, 0, 5.h),
    child: Row(
      children: [
        icon,
        SizedBox(
          width: 5.h,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        )
      ],
    ),
  );
}
