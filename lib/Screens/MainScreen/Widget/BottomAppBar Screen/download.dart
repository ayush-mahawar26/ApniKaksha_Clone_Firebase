// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Download extends StatefulWidget {
  const Download({Key? key}) : super(key: key);

  @override
  _DownloadState createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Download"),
    );
  }
}
