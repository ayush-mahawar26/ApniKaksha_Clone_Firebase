// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, must_be_immutable

import 'package:apni_kaksha/Models/item_vedio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LectureVedioPlayer extends StatelessWidget {
  VedioTile item;
  LectureVedioPlayer({Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String? vedioID = YoutubePlayerController.convertUrlToId(item.link);

    if (vedioID != null) {
      YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: vedioID.toString(),
          params: YoutubePlayerParams(
            autoPlay: true,
            mute: false,
            showControls: true,
          ));
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
              centerTitle: true,
              title: Image(
                image: const AssetImage("assets/apnikaksha.png"),
                width: 50.h,
                height: 50.h,
              ),
              toolbarHeight: 50.h,
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
              backgroundColor: const Color(0xff051119)),
          body: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width.w,
                child: YoutubePlayerIFrame(
                  controller: _controller,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                child: Text(
                  item.title,
                  style: TextStyle(
                      color: Colors.blueGrey[900],
                      fontWeight: FontWeight.w600,
                      fontSize: 20.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
              )
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text("Sorry"),
      );
    }
  }
}
