import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_mange/main.dart';
import 'package:food_mange/src/home/components/app_bar.dart';
import 'package:food_mange/src/home/components/itemCard.dart';
import 'package:food_mange/src/home/components/search_box.dart';
import 'package:food_mange/src/home/home-screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_mange/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Details extends StatefulWidget {
  String name;
  String price;
  String detail;
  String img;

  Details(String name, String price, String detail, String img) {
    this.name = name;
    this.price = price;
    this.detail = detail;
    this.img = img;
  }

  @override
  _DetailsState createState() => _DetailsState(name, price, detail, img);
}

class _DetailsState extends State<Details> {
  String name;
  String price;
  String detail;
  String img;
  _DetailsState(String name, String price, String detail, String img) {
    this.name = name;
    this.price = price;
    this.detail = detail;
    this.img = img;

    print(name);
  }

  Map data;
  List DetailsData;

  // getProducts() async {
  //   http.Response response =
  //       await http.get('http://192.168.1.2:8000/details/$product_id');
  //   // debugPrint(response.body);
  //   data = json.decode(response.body);
  //   tagsJson = json.decode(response.body)['product_name'];
  //   // debugPrint('test');
  //   print(tagsJson);

  //   setState(() {
  //     DetailsData = data['products'];
  //     tags = tagsJson != null ? List.from(tagsJson) : null;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: homeAppBar(context),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    '$img',
                    width: 350,
                    height: 350,
                  ),
                ),
                Spacer(),
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: RichText(
                          overflow: TextOverflow.ellipsis,

                          // textAlign: TextAlign.center,
                          text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .title
                                .copyWith(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: "$name \n\n",
                                style: TextStyle(color: kPrimaryColor),
                              ),
                              TextSpan(
                                text: "Price : ฿ $price\n\n",
                                style: TextStyle(color: kSecondaryColor),
                              ),
                              TextSpan(
                                text: "$detail \n ",
                                style: TextStyle(color: kSecondaryColor),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
              ],
            ),
          ),
        ));
  }
}
