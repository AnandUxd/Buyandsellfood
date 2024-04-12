import 'dart:async';

import 'package:buyandsellfood/modules/views/introscreen.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  _moveToNextScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => (PageScreen())));
  }

  _loadAndMove() {
    Timer(Duration(seconds: 3), () {
      _moveToNextScreen();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadAndMove();
  }

  @override
  Widget build(BuildContext context) {

 var media = MediaQuery.of(context).size;
     return Scaffold(
      backgroundColor: Colors.white, // Set background color
      body: Center(
        child: Image.asset(
          'assets/logo.png', // Replace with your image path
          width: media.width * 0.6, // Adjust width as needed
          height: media.height * 0.5, // Adjust height as needed
        ),
      ),
    );
  }
  }