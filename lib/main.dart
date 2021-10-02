// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison
import 'package:apni_kaksha/Screens/MainScreen/home.dart';
import 'package:apni_kaksha/Screens/enter_option.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(DevicePreview(
    builder: (_) => MyApp(),
    enabled: !kReleaseMode,
  ));
  // runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool loggedIn = false;

  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  checkUserLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    Object? userEmail = pref.get("email");
    if (userEmail != null) {
      loggedIn = true;
      print("UserAlready Signed In");
    } else {
      print("User Is not signIn yet");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => MaterialApp(
              home: (loggedIn == false) ? EnterOption() : HomeScreen(),
            ));
  }
}
