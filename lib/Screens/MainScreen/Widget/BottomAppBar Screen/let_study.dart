// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LetStudy extends StatefulWidget {
  const LetStudy({Key? key}) : super(key: key);

  @override
  _LetStudyState createState() => _LetStudyState();
}

class _LetStudyState extends State<LetStudy> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Let's Study"),
    );
  }
}
