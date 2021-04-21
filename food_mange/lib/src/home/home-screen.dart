import 'package:flutter/material.dart';
import 'package:food_mange/src/home/components/body.dart';
import 'components/app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      body: Body(),
    );
  }
}
