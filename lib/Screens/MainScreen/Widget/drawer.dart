// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:apni_kaksha/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget {
  Widget drawer(BuildContext context) {
    final auth = FirebaseAuth.instance;
    String? userName = auth.currentUser!.displayName;
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
                  color: Colors.grey,
                ),
                "Home",
                null,
                null, () {
              print("Home");
            }),
            listTileItem(
                Icon(
                  CupertinoIcons.settings,
                  color: Colors.grey,
                  size: 18.sp,
                ),
                "Settings",
                null,
                null, () {
              print("Setting");
            }),
            listTileItem(
                Icon(
                  Icons.format_align_left_rounded,
                  size: 20.sp,
                  color: Colors.grey,
                ),
                "Terms and Conditions",
                null,
                null, () {
              print("TNC");
            }),
            listTileItem(
                Icon(
                  CupertinoIcons.signature,
                  size: 20.sp,
                  color: Colors.grey,
                ),
                "Privacy Policy",
                null,
                null, () {
              print("Privacy Policy");
            }),
            listTileItem(
                Icon(
                  CupertinoIcons.repeat,
                  size: 20.sp,
                  color: Colors.grey,
                ),
                "Refund",
                null,
                null, () {
              print("Refund");
            }),
            listTileItem(
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 20.sp,
                ),
                "Rate",
                true,
                Colors.yellow, () {
              print("Rate");
            }),
            listTileItem(
                Icon(
                  Icons.share,
                  color: Colors.blue,
                  size: 20.sp,
                ),
                "Share",
                true,
                Colors.blue, () {
              print("Share");
            }),
            listTileItem(
                Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 20.sp,
                ),
                "Logout",
                true,
                Colors.red, () async {
              await auth.signOut();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => Wrapper()),
                  (route) => false);
            })
          ],
        ),
      )),
    );
  }
}

Widget listTileItem(
    var icon, String title, bool? custom, Color? color, Function perform) {
  var poppins = GoogleFonts.poppins().fontFamily;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.h),
    child: ListTile(
      onTap: () {
        perform();
      },
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
  );
}
