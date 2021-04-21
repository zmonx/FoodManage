import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_mange/src/home/pages/candy.dart';
import 'package:food_mange/src/home/pages/dessert.dart';
import 'package:food_mange/src/home/pages/food.dart';
import 'package:food_mange/src/home/pages/ice.dart';

Container Menu_nav_row2(BuildContext context) {
  return Container(
      margin: EdgeInsets.only(right: 10.0, top: 10.0, left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Food()),
              );
            },
            child: Image.asset(
              'assets/images/ifood.png',
              width: 85,
              height: 85,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dessert()),
              );
            },
            child: Image.asset(
              'assets/images/idessert.png',
              width: 85,
              height: 85,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Candy()),
              );
            },
            child: Image.asset(
              'assets/images/icandy.png',
              width: 85,
              height: 85,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ice()),
              );
            },
            child: Image.asset(
              'assets/images/iice.png',
              width: 85,
              height: 85,
            ),
          ),
        ],
      ));
}
