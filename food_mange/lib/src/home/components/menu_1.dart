import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mange/src/home/pages/bakery.dart';
import 'package:food_mange/src/home/pages/drink.dart';
import 'package:food_mange/src/home/pages/promotions.dart';
import 'package:food_mange/src/home/pages/snacks.dart';

Container Menu_nav_row1(BuildContext context) {
  return Container(
      margin: EdgeInsets.all(1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Promotions()),
              );
            },
            child: Image.asset(
              'assets/images/ipromotion.png',
              width: 85,
              height: 85,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bakery()),
              );
            },
            child: Image.asset(
              'assets/images/ibekery.png',
              width: 85,
              height: 85,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Drink()),
              );
            },
            child: Image.asset(
              'assets/images/idrink.png',
              width: 85,
              height: 85,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Snacks()),
              );
            },
            child: Image.asset(
              'assets/images/isnacks.png',
              width: 85,
              height: 85,
            ),
          ),
        ],
      ));
}
