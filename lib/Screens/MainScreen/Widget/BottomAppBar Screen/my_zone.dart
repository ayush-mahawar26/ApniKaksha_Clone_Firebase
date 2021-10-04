// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyZone extends StatefulWidget {
  const MyZone({Key? key}) : super(key: key);

  @override
  _MyZoneState createState() => _MyZoneState();
}

class _MyZoneState extends State<MyZone> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("MyZone"),
    );
  }
}
