import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start/apis/home.dart';
import 'package:start/pages/auth/login.dart';
import 'package:start/pages/auth/profile.dart';
import 'package:start/pages/home.dart';
import 'package:start/pages/intro.dart';
import 'package:start/shared/shared.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    check();
  }

  check() async {
    Timer(Duration(seconds: 2), () async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool? openIntro = preferences.getBool("openIntro");
      userId = preferences.getString("userId");
      print("openIntro $openIntro");
      if (userId == null || userId == 'null') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const LoginPage(),
          ),
        );
      } else {
        if (openIntro == false) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const HomePage(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => const IntorPage(),
            ),
          );
        }
        /* Navigator.pushReplacement(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const ProfilePag(),
          ),
        ); */
      }
    });
    /*   Timer(Duration(seconds: 3), () {
      print("Welcome");
    }); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://storage.googleapis.com/cms-storage-bucket/0dbfcc7a59cd1cf16282.png",
              width: 100,
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
