import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_mange/src/home/pages/detail.dart';

import '../../../constants.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: SvgPicture.asset("assets/icons/menu.svg"),
      onPressed: () {},
    ),
    title: Center(
      child: RichText(
        // textAlign: TextAlign.center,
        text: TextSpan(
          style: Theme.of(context)
              .textTheme
              .title
              .copyWith(fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: "Software",
              style: TextStyle(color: kSecondaryColor),
            ),
            TextSpan(
              text: " Cafe'",
              style: TextStyle(color: kPrimaryColor),
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      IconButton(
        icon: SvgPicture.asset("assets/icons/notification.svg"),
        onPressed: () {
          // Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Details()),
          //     );
        },
      )
    ],
  );
}
