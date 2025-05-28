import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:start/pages/home.dart';
import 'package:start/pages/intro.dart';

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
      print("openIntro $openIntro");
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
