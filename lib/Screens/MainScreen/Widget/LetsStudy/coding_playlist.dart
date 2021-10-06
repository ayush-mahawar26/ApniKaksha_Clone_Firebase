import 'package:apni_kaksha/Models/playlist.dart';
import 'package:apni_kaksha/Screens/MainScreen/Widget/LetsStudy/placement_chapter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CodingPlaylist extends StatefulWidget {
  const CodingPlaylist({Key? key}) : super(key: key);

  @override
  _CodingPlaylistState createState() => _CodingPlaylistState();
}

class _CodingPlaylistState extends State<CodingPlaylist> {
  var poppins = GoogleFonts.poppins().fontFamily;
  Color blacktype = const Color(0xff051119);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.h,
          elevation: 0.0,
          backgroundColor: blacktype,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
          title: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Image(
              image: const AssetImage("assets/apnikaksha.png"),
              height: 50.h,
              width: 50.h,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Playlist",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: poppins,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  PlayList().playlistItem(
                      "Web Development", context, "assets/code.jpg"),
                  InkWell(
                    child: PlayList().playlistItem(
                        "Tech Placement Notes", context, "assets/code.jpg"),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => PlacementChapter()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
