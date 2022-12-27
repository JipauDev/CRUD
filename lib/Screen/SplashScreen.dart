import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'OnBoardingScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  /// Check user
  bool _checkUser = true;

  bool loggedIn = false;

  @override
  late SharedPreferences prefs;

  ///
  /// Checking user is logged in or not logged in
  ///
  Future<Null> _function() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    this.setState(() {
      if (prefs.getString("username") != null) {
        print('false');
        _checkUser = false;
      } else {
        print('true');
        _checkUser = true;
      }
    });
  }

  void _Navigator() {
    // if (currentUser == null) {
    //     Navigator.of(context).pushReplacement(
    //         PageRouteBuilder(pageBuilder: (_, __, ___) => OnBoarding()));
    //   } else {
    //     FirebaseFirestore.instance
    //         .collection("users")
    //         .doc(currentUser.uid)
    //         .get()
    //         .then((DocumentSnapshot result) => Navigator.pushReplacement(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => BottomNavigationScreen(
    //                     // idUser: currentUser.uid,
    //                     ))))
    //         .catchError((err) => print(err));
    //   }

    Navigator.of(context).pushReplacement(
        PageRouteBuilder(pageBuilder: (_, __, ___) => OnBoardingScreen()));
  }

  /// Set timer splash
  _timer() async {
    return Timer(const Duration(milliseconds: 2300), _Navigator);
  }

  @override
  void initState() {
    super.initState();
    _timer();
  }

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Center(
              child: Image.asset(
                "assets/images/logo.png",
                width: 210.0,
                height: 130.0,
              ),
            ),
            Center(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 3.0),
              child: Text(
                "Version 1.0",
                style: TextStyle(
                    fontFamily: "Popins",
                    color: Color.fromARGB(66, 16, 14, 14),
                    fontWeight: FontWeight.w300,
                    fontSize: 19.0),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
