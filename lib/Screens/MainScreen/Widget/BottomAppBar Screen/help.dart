// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    var poppins = GoogleFonts.poppins().fontFamily;

    List<String> issuesOfApp = [
      "Payment related Issue",
      "Existing course related Issue",
      "New course related query",
      "Youtube channel related query"
    ];

    String choosenIssue = "";

    return SizedBox(
      width: MediaQuery.of(context).size.width.w,
      height: MediaQuery.of(context).size.height.h,
      child: Expanded(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Help",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: poppins,
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10.h,
              ),
              entryBox(
                "Name",
                isNumber: false,
                isMaxLine: false,
              ),
              entryBox(
                "E - mail",
                isNumber: false,
                isMaxLine: false,
              ),
              entryBox(
                'Phone Number',
                isNumber: true,
                isMaxLine: false,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: DropdownButtonFormField(
                  items: listDropDown(issuesOfApp),
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13.h, horizontal: 20.h),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                        borderSide:
                            BorderSide(color: Color(0xff505154), width: 2.w)),
                  ),
                  iconSize: 20.sp,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    fontFamily: poppins,
                  ),
                  onChanged: (String? issue) {
                    setState(() {
                      choosenIssue = issue!;
                    });
                  },
                  hint: Text("Select issue",
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontFamily: poppins,
                          fontSize: 15.sp)),
                ),
              ),

              // Issue Detail Entry Box
              entryBox(
                "Write about the probelem",
                isNumber: false,
                isMaxLine: true,
              ),

              SizedBox(
                height: 30.h,
              ),

              // submit Issue Buttom

              SizedBox(
                width: MediaQuery.of(context).size.width.w,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.pink),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))))),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      child: Text(
                        "Submit Issue",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: poppins,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
              ),
              SizedBox(height: 20.h)
            ],
          ),
        ),
      )),
    );
  }
}

DropdownMenuItem<String> dropDownItem(String issue) {
  return DropdownMenuItem<String>(
    child: Text(issue),
    value: issue,
  );
}

List<DropdownMenuItem<String>> listDropDown(List<String> issueList) {
  List<DropdownMenuItem<String>> lst = [];
  for (String issue in issueList) {
    lst.add(dropDownItem(issue));
  }

  return lst;
}

Widget entryBox(String hint,
    {required bool isNumber, required bool isMaxLine}) {
  var poppins = GoogleFonts.poppins().fontFamily;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: TextFormField(
      maxLines: isMaxLine ? 6 : null,
      keyboardType: isNumber ? TextInputType.phone : TextInputType.name,
      style: TextStyle(color: Colors.black, fontSize: 20.sp),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.w, 10.h, 5.w, 10.h),
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15.sp,
              fontFamily: poppins,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              borderSide: BorderSide(color: Color(0xff505154), width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
              borderSide: BorderSide(color: Color(0xff505154), width: 2))),
    ),
  );
}
