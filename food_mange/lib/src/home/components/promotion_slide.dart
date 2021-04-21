import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'search_box.dart';

Center promotion_slide() {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SearchBox(
          onChanged: (value) {},
        ),
        Center(
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
      ],
    ),
  );
}
