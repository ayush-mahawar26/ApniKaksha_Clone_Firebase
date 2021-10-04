import 'package:apni_kaksha/Screens/MainScreen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  // Stayed Login Stream -> For stayed login
  Stream<User?> get userCheck {
    return _auth.authStateChanges().map((event) => _auth.currentUser);
  }

  // For showing Error Message
  showToast(String mssg) {
    Fluttertoast.showToast(
        msg: mssg,
        fontSize: 15.sp,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT);
  }

  // fuction for Sign In with Email and password
  signInwithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        showToast("User Not Found");
      } else if (e.code == "wrong-password") {
        showToast("Invalid Password");
      } else {
        showToast(e.toString());
      }
    }
  }
}
