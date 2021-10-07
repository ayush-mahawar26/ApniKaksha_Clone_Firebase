// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    String? vedioID = YoutubePlayerController.convertUrlToId(
        "https://www.youtube.com/watch?v=aDH1cy51Oc0");

    _controller = YoutubePlayerController(
        initialVideoId: vedioID.toString(),
        params: YoutubePlayerParams(
          autoPlay: true,
          mute: true,
          showControls: false,
          startAt: Duration(seconds: 46),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
        child: Column(
          children: [
            YoutubePlayerIFrame(
              controller: _controller,
            ),
            SizedBox(height: 60.h),
            Image(image: AssetImage("assets/team.jpg")),
            SizedBox(height: 60.h),
            newBatch(
                "assets/jeeDroper.jpg",
                "     JEE Droppers 2022 ( Mains / Advanced )",
                "Live Classes ( Recording Available for same )",
                "Chapter Summary after each chapter",
                "Live Doubt Session after each chapter",
                "Daily Practice Probelem with Vedio Solutions",
                "Test Series with additional Chapter wise Tests every 14 Days",
                context),
          ],
        ),
      ),
    );
  }
}

Widget newBatch(String path, String batchName, String p1, String p2, String p3,
    String p4, String p5, BuildContext context) {
  var poppins = GoogleFonts.poppins().fontFamily;

  return SizedBox(
    width: MediaQuery.of(context).size.width.w,
    child: Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: Image(image: AssetImage(path)),
          ),
          SizedBox(
            height: 40.h,
            width: MediaQuery.of(context).size.width.w / 1.4,
            child: Marquee(
              velocity: 40,
              text: batchName,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.sp,
                fontFamily: poppins,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            color: Colors.grey[300],
            height: 2.h,
            width: MediaQuery.of(context).size.width.w / 1.4,
          ),
          pointForBatch(p1, context),
          pointForBatch(p2, context),
          pointForBatch(p3, context),
          pointForBatch(p4, context),
          pointForBatch(p5, context),
          SizedBox(height: 20.h),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(10.r))))),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  child: Text(
                    "Explore",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: poppins,
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    ),
  );
}

Widget pointForBatch(String point, BuildContext context) {
  return ListTile(
    leading: Icon(
      Icons.fiber_manual_record,
      size: 15.sp,
      color: Colors.grey[500],
    ),
    title: SizedBox(
      width: MediaQuery.of(context).size.width.w / 1.2,
      child: Align(
        alignment: Alignment(-2, 0),
        child: Text(
          point,
          style: TextStyle(
              color: Colors.grey[500],
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}
