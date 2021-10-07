// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:apni_kaksha/Screens/Services/auth_services.dart';
import 'package:apni_kaksha/wrapper.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // runApp(DevicePreview(
  //   builder: (_) => MyApp(),
  //   enabled: !kReleaseMode,
  // ));
  runApp(MyApp());
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
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().userCheck,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
