import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'menu_1.dart';
import 'menu_2.dart';
import 'search_box.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBox(
            onChanged: (value) {},
          ),
          Container(
            margin: EdgeInsets.only(bottom: 50),
            padding: EdgeInsets.all(5),
            child: ImageSlideshow(
              width: double.infinity,
              height: 250,
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.asset(
                  'assets/images/p1.png',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/images/p2.png',
                  fit: BoxFit.fitWidth,
                ),
                Image.asset(
                  'assets/images/p3.png',
                  fit: BoxFit.fitWidth,
                ),
              ],
              onPageChanged: (value) {
                // print('Page changed: $value');
              },
              autoPlayInterval: 5000,
            ),
          ),
          Menu_nav_row1(context),
          Menu_nav_row2(context),
        ],
      ),
    );
  }
}
