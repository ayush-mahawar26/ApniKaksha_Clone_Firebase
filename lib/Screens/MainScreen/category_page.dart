// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  var poppins = GoogleFonts.poppins().fontFamily;
  var fredoka = GoogleFonts.fredokaOne().fontFamily;
  Color blacktype = Color(0xff051119);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: 60.h,
          backgroundColor: blacktype,
          elevation: 0,
          centerTitle: true,
          title: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.r)),
            child: Image(
                height: 50.h,
                width: 50.h,
                image: AssetImage(
                  "assets/apnikaksha.png",
                )),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select Category",
                        style: TextStyle(
                          fontSize: 25.sp,
                          color: blacktype,
                          fontFamily: fredoka,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),

                      //  Search BOX
                      TextFormField(
                          style: TextStyle(
                            fontSize: 18.sp,
                          ),
                          decoration: InputDecoration(
                              hintText: "Search Category",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: poppins,
                                fontSize: 16.sp,
                              ),
                              prefixIcon: Icon(
                                CupertinoIcons.search,
                                color: Colors.grey,
                                size: 18.sp,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.w,
                                  ),
                                  borderRadius: BorderRadius.circular(8.r)))),

                      // Card View
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.h),
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border:
                                    Border.all(color: Colors.pink, width: 2.w)),
                            width: MediaQuery.of(context).size.width.w / 2.5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Image(
                                    image: AssetImage(
                                      "assets/read.png",
                                    ),
                                    fit: BoxFit.cover,
                                    width: 100.w,
                                    height: 100.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.r),
                                  child: Text(
                                    "All catergory",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: poppins,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width.w,
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        child: Text(
                          "Save",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: poppins,
                          ),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
