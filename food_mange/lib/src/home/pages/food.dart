import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_mange/src/home/components/itemCard.dart';
import 'package:food_mange/src/home/components/search_box.dart';
import 'package:food_mange/src/home/home-screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_mange/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'detail.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Map data;
  List foodData;
  String name;
  String price;
  String detail;
  String img;
  getProducts() async {
    http.Response response =
        await http.get('http://192.168.1.2:8000/category5');
    // debugPrint(response.body);
    data = json.decode(response.body);
    // debugPrint('test');

    setState(() {
      foodData = data['products'];
      print("Lenght :");
      print(foodData.length);
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Stack(children: <Widget>[
          Container(
            height: size.height * .19,
            decoration: BoxDecoration(
              color: Colors.green[600],
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.only(top: 20, right: 10),
                    alignment: Alignment.center,
                  ),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text("อาหารหลัก",
                        style: Theme.of(context)
                            .textTheme
                            .display1
                            .merge(GoogleFonts.kanit())
                            .copyWith(
                              color: Colors.white,
                            )),
                  ),
                ),
                SearchBox(),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemCount: foodData == null ? 0 : foodData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        if (foodData.length == 0) {
                          return Text('not available');
                        } else
                          return ItemCard2(
                            title: "${foodData[index]["product_name"]}",
                            svgSrc: "${foodData[index]["img"]}",
                            press: () {
                              setState(() {
                                name = "${foodData[index]["product_name"]}";
                                price = "${foodData[index]["price"]}";
                                detail = "${foodData[index]["detail"]}";
                                img = "${foodData[index]["img"]}";
                              });
                              // testapi(id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Details(name, price, detail, img)),
                              );
                            },
                          );
                      }),
                ),
              ],
            ),
          )
        ]));
  }
}
