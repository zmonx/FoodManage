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

class Snacks extends StatefulWidget {
  @override
  _SnacksState createState() => _SnacksState();
}

class _SnacksState extends State<Snacks> {
  @override
  Map data;
  List SnacksData;
  String name;
  String price;
  String detail;
  String img;
  getProducts() async {
    http.Response response =
        await http.get('http://192.168.1.2:8000/category4');
    // debugPrint(response.body);
    data = json.decode(response.body);
    // debugPrint('test');

    setState(() {
      SnacksData = data['products'];
      print("Lenght :");
      print(SnacksData.length);
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
                    child: Text("ของว่าง",
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
                      itemCount: SnacksData == null ? 0 : SnacksData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemCard2(
                          title: "${SnacksData[index]["product_name"]}",
                          svgSrc: "${SnacksData[index]["img"]}",
                          press: () {
                            setState(() {
                              name = "${SnacksData[index]["product_name"]}";
                              price = "${SnacksData[index]["price"]}";
                              detail = "${SnacksData[index]["detail"]}";
                              img = "${SnacksData[index]["img"]}";
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

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:food_mange/src/home/components/itemCard.dart';
// import 'package:food_mange/src/home/components/search_box.dart';
// import 'package:food_mange/src/home/home-screen.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:food_mange/constants.dart';

// class Snacks extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//         backgroundColor: kBackgroundColor,
//         body: Stack(children: <Widget>[
//           Container(
//             height: size.height * .19,
//             decoration: BoxDecoration(
//               color: Colors.green[600],
//             ),
//           ),
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: Container(
//                     margin: EdgeInsets.only(top: 20, right: 10),
//                     alignment: Alignment.center,
//                   ),
//                 ),
//                 Center(
//                   child: Container(
//                     padding: EdgeInsets.all(20),
//                     child: Text("อาหารว่าง",
//                         style: Theme.of(context)
//                             .textTheme
//                             .display1
//                             .merge(GoogleFonts.kanit())
//                             .copyWith(color: Colors.white)),
//                   ),
//                 ),
//                 SearchBox(),
//                 Expanded(
//                   child: GridView.count(
//                     crossAxisCount: 2,
//                     childAspectRatio: .85,
//                     crossAxisSpacing: 20,
//                     mainAxisSpacing: 20,
//                     children: <Widget>[
//                       ItemCard2(
//                         title: "ไส้กรอก ต๊อกบอกกีชีส",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/90e6ba2964084fe8ab6684ecc86d7aa0.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "ขนมจีบไก่",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/5c98ab2aba064e70b8d2f2504f4c5a19.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "ไส้กรอกอกไก่",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/008264781ca042a1bec0c3eefff4d4d1.jpg",
//                         press: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) {
//                               return HomeScreen();
//                             }),
//                           );
//                         },
//                       ),
//                       ItemCard2(
//                         title: "เปาเศรษฐี",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/44de5d15f0f148a49249ae138a253355.jpg",
//                         press: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ]));
//   }
// }
