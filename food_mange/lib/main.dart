import 'package:flutter/material.dart';
import 'package:food_mange/constants.dart';
import 'package:food_mange/src/home/home-screen.dart';
import 'package:food_mange/src/home/pages/food.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
// import 'home_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  // void initState() {
  //   // Food.randomDog();
  //   initState();
  // }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Manager',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: kPrimaryColor,
          // textTheme: TextTheme(
          //   body1: TextStyle(color: kSecondaryColor),
          //   body2: TextStyle(color: kSecondaryColor),
          // ),
          textTheme: GoogleFonts.kanitTextTheme(textTheme)),
      home: HomeScreen(),
    );
  }
}
