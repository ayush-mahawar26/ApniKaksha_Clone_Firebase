// ignore_for_file: prefer_const_constructors

import 'package:apni_kaksha/Screens/MainScreen/home.dart';
import 'package:apni_kaksha/Screens/enter_option.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    // print(user);

    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: () => (user == null) ? EnterOption() : HomeScreen(),
    );
  }
}
