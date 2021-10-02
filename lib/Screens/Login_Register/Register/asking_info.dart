// ignore_for_file: prefer_const_constructors, prefer_final_fields, must_be_immutable

import 'package:apni_kaksha/Screens/MainScreen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AskingInfo extends StatefulWidget {
  String phnNumber;
  AskingInfo({Key? key, required this.phnNumber}) : super(key: key);

  @override
  _AskingInfoState createState() => _AskingInfoState();
}

class _AskingInfoState extends State<AskingInfo> {
  var poppins = GoogleFonts.poppins().fontFamily;
  var nameController = TextEditingController();
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();
  bool isSecure = true;
  bool registered = false;
  Icon currentIcon = Icon(
    CupertinoIcons.eye_fill,
    color: Colors.black,
    size: 20.sp,
  );
  String choosenState = "";

  // Fution of eye in PAssword
  _toggleView() {
    setState(() {
      if (isSecure) {
        isSecure = false;
        currentIcon = Icon(
          CupertinoIcons.eye_slash_fill,
          color: Colors.black,
          size: 20.sp,
        );
      } else {
        isSecure = true;
        currentIcon = Icon(
          CupertinoIcons.eye_fill,
          color: Colors.black,
          size: 20.sp,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> listOfState = [
      "Andhra Pradesh",
      "Arunachal Pradesh",
      "Assam",
      "Bihar",
      "Chhattisgarh",
      "Goa",
      "Gujarat",
      "Haryana",
      "Himachal Pradesh",
      "Jammu and Kashmir",
      "Jharkhand",
      "Karnataka",
      "Kerala",
      "Madhya Pradesh",
      "Maharashtra",
      "Manipur",
      "Meghalaya",
      "Mizoram",
      "Nagaland",
      "Odisha",
      "Punjab",
      "Rajasthan",
      "Sikkim",
      "Tamil Nadu",
      "Telangana",
      "Tripura",
      "Uttarakhand",
      "Uttar Pradesh",
      "West Bengal",
      "Andaman and Nicobar Islands",
      "Chandigarh",
      "Dadra and Nagar Haveli",
      "Daman and Diu",
      "Delhi",
      "Lakshadweep",
      "Puducherry",
    ];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 10.h, 0, 10.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
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
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            "Register Account",
                            style: TextStyle(
                                fontFamily: poppins,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Icon(
                            CupertinoIcons.arrow_right,
                            size: 20.sp,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      labelText(
                          "Name",
                          Icon(
                            Icons.person,
                            size: 16.sp,
                          )),
                      textFeild(nameController, "Enter Name"),
                      SizedBox(
                        height: 20.h,
                      ),
                      labelText("Phone Number", Icon(Icons.call)),
                      TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.fromLTRB(20.w, 13.h, 0, 13.h),
                          hintText: "+91 ${widget.phnNumber}",
                          hintStyle: TextStyle(
                              color: Colors.grey[400], fontSize: 16.sp),
                          disabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 2.w),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r))),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      labelText("E - Mail Address", Icon(Icons.email)),
                      textFeild(emailCtrl, "Enter E - Mail Address"),

                      SizedBox(
                        height: 20.h,
                      ),
                      labelText("Password", Icon(Icons.password_rounded)),

                      //Password ENtry Box
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: TextFormField(
                            controller: passCtrl,
                            obscureText: isSecure,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontFamily: poppins),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.w, 13.h, 0, 13.h),
                              hintText: "Password",
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: InkWell(
                                  onTap: () {
                                    _toggleView();
                                  },
                                  child: currentIcon,
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.grey[400], fontSize: 16.sp),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.w),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 2.w),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                            )),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      labelText("State", Icon(CupertinoIcons.map)),

                      SizedBox(
                        height: 5.h,
                      ),

                      // Drop Down
                      DropdownButtonFormField<String>(
                        iconSize: 19.sp,
                        elevation: 0,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.w, 13.h, 0, 13.h),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                    color: Colors.grey, width: 3.w))),
                        hint: Text("States",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontFamily: poppins,
                                fontSize: 15.sp)),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: poppins,
                            fontSize: 14.sp),
                        onChanged: (String? newValue) {
                          setState(() {
                            choosenState = newValue!;
                          });
                        },
                        items: dropDownItem(listOfState),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),

                      // Button For Register

                      Padding(
                        padding: EdgeInsets.only(bottom: 30.h),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width.w,
                          height: 50.h,
                          child: ElevatedButton(
                            onPressed: () {
                              if (nameController.text.isEmpty) {
                                showToast("Please Enter Your Name");
                              } else if (emailCtrl.text.isEmpty) {
                                showToast("Please Enter Your Email Address");
                              } else if (passCtrl.text.isEmpty) {
                                showToast("Enter Password");
                              } else if (choosenState == "") {
                                showToast("Select Your State");
                              } else {
                                registerUser(nameController.text,
                                    emailCtrl.text, passCtrl.text, context);
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.pink),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.r)))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: poppins,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Toast That show on empty feild submit
Future showToast(String mssg) {
  return Fluttertoast.showToast(
      msg: mssg,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 15.sp,
      timeInSecForIosWeb: 1,
      gravity: ToastGravity.BOTTOM);
}

// Registering the User After Clicking on Register Button
registerUser(
    String name, String email, String password, BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  if (user != null) {
    if (user.email == null) {
      // Entering Users credential
      user.updateDisplayName(name);
      user.updateEmail(email);
      user.updatePassword(password);

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("email", user.email.toString());
      print("Logged In HomeScreen");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("User Already Exist")));
    }
  }
}

List<DropdownMenuItem<String>> dropDownItem(List<String> state) {
  List<DropdownMenuItem<String>> lst = [];
  for (String i in state) {
    lst.add(DropdownMenuItem(
      child: Text(i),
      value: i,
    ));
  }

  return lst;
}

Widget labelText(String title, Icon icon) {
  return Row(
    children: [
      icon,
      SizedBox(
        width: 5.w,
      ),
      Text(title,
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ))
    ],
  );
}

Widget textFeild(TextEditingController? controller, String hint) {
  return Padding(
    padding: EdgeInsets.only(top: 5.h),
    child: TextFormField(
      controller: controller,
      style: TextStyle(
          fontSize: 16.sp, fontFamily: GoogleFonts.poppins().fontFamily),
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.fromLTRB(20.w, 13.h, 0, 13.h),
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 16.sp),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 2.w),
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
      ),
    ),
  );
}
