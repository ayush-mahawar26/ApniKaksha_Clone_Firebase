// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:apni_kaksha/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Widget drawer(BuildContext context) {
    String? userName = _auth.currentUser!.displayName;
    return SizedBox(
      width: MediaQuery.of(context).size.width.w * 0.85,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              SizedBox(height: 50.h),
              DrawerHeader(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  accountName: Text(
                    userName.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 20.sp,
                    ),
                  ),
                  accountEmail: null,
                  currentAccountPicture: Image(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/apnikaksha.png")),
                ),
              ),
              listTileItem(
                  Icon(
                    CupertinoIcons.home,
                    size: 20.sp,
                  ),
                  "Home",
                  null,
                  null, () {
                print("Home");
              }),
              listTileItem(
                  Icon(
                    CupertinoIcons.settings,
                    size: 20.sp,
                  ),
                  "Setting",
                  null,
                  null, () {
                print("Setting");
              }),
              listTileItem(
                  Icon(
                    CupertinoIcons.signature,
                    size: 20.sp,
                  ),
                  "Terms and Condition",
                  null,
                  null, () {
                print("TNC");
              }),
              listTileItem(
                  Icon(
                    CupertinoIcons.pencil_ellipsis_rectangle,
                    size: 20.sp,
                  ),
                  "Privacy Policy",
                  null,
                  null, () {
                print("Privacy Policy");
              }),
              listTileItem(
                  Icon(
                    CupertinoIcons.return_icon,
                    size: 20.sp,
                  ),
                  "Refund/Cancellation Policy",
                  null,
                  null, () {
                print("Refund");
              }),
              listTileItem(
                  Icon(
                    CupertinoIcons.star_fill,
                    size: 20.sp,
                    color: Colors.yellow,
                  ),
                  "Rate",
                  true,
                  Colors.yellow, () {
                print("Rate");
              }),
              listTileItem(
                  Icon(
                    Icons.share,
                    size: 20.sp,
                    color: Colors.blue,
                  ),
                  "Share",
                  true,
                  Colors.blue, () {
                print("Share");
              }),
              listTileItem(
                  Icon(
                    Icons.logout,
                    size: 20.sp,
                    color: Colors.red,
                  ),
                  "Logout",
                  true,
                  Colors.red, () async {
                try {
                  _auth.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Wrapper()),
                      (route) => false);
                } catch (e) {
                  print(e.toString() + " - > error");
                  return;
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

Widget listTileItem(
    var icon, String title, bool? custom, Color? color, Function perform) {
  var poppins = GoogleFonts.poppins().fontFamily;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: InkWell(
      onTap: () {
        perform();
      },
      child: ListTile(
        leading: icon,
        title: Text(
          title,
          style: TextStyle(
            color: (custom == true) ? color : Colors.black,
            fontSize: 16.sp,
            fontFamily: poppins,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
