// ignore_for_file: unnecessary_null_comparison

import 'package:apni_kaksha/Models/item_vedio.dart';
import 'package:apni_kaksha/Screens/MainScreen/Widget/LetsStudy/design_theory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TheoryLecture extends StatefulWidget {
  const TheoryLecture({Key? key}) : super(key: key);

  @override
  _TheoryLectureState createState() => _TheoryLectureState();
}

class _TheoryLectureState extends State<TheoryLecture> {
  List<Map> vedioMap = [
    {
      "title": "Object Oriented Programming",
      "path": "assets/oops.jpg",
      "link":
          "https://www.youtube.com/watch?v=iAvORz4ApbY&list=PLfqMhTWNBTe1wRkDkQ0m1lJ7KDpTNRuvj"
    },
    {
      "title": "Database Management Systems",
      "path": "assets/dbms.jpg",
      "link":
          "https://www.youtube.com/watch?v=f1oV46r69YM&list=PLfqMhTWNBTe1wRkDkQ0m1lJ7KDpTNRuvj&index=2"
    },
    {
      "title": "Operating System",
      "path": "assets/os.jpg",
      "link":
          "https://www.youtube.com/watch?v=ktP8QsPzKfs&list=PLfqMhTWNBTe1wRkDkQ0m1lJ7KDpTNRuvj&index=3"
    },
    {
      "title": "Computer Network",
      "path": "assets/cn.jpg",
      "link":
          "https://www.youtube.com/watch?v=gfwMYLQaZP0&list=PLfqMhTWNBTe1wRkDkQ0m1lJ7KDpTNRuvj&index=4"
    },
  ];

  bool loadedAll = false;

  @override
  void initState() {
    super.initState();
    for (Map vedioProp in vedioMap) {
      if (ItemVedios.vedioLst.length != vedioMap.length) {
        ItemVedios.vedioLst.add(VedioTile(
            title: vedioProp["title"],
            imagePath: vedioProp["path"],
            link: vedioProp["link"]));
      }
    }

    loadedAll = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff051119),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            CupertinoIcons.arrow_left,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
        toolbarHeight: 50.h,
        // ignore: prefer_const_constructors
        title: Image(
          image: const AssetImage("assets/apnikaksha.png"),
          height: 50.h,
          width: 50.h,
          fit: BoxFit.cover,
        ),
      ),
      body: (ItemVedios.vedioLst == null || ItemVedios.vedioLst.isEmpty)
          // ignore: prefer_const_constructors
          ? Center(
              child: const CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return DesignTheory(item: ItemVedios.vedioLst[index]);
              },
              itemCount: ItemVedios.vedioLst.length,
            ),
    );
  }
}
