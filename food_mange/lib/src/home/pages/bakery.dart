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

class Bakery extends StatefulWidget {
  @override
  _BakeryState createState() => _BakeryState();
}

class _BakeryState extends State<Bakery> {
  @override
  Map data;
  String name;
  String price;
  String detail;
  String img;

  List BakeryData;
  getProducts() async {
    http.Response response =
        await http.get('http://192.168.1.2:8000/category2');
    // debugPrint(response.body);
    data = json.decode(response.body);
    // debugPrint('test');

    setState(() {
      BakeryData = data['products'];
      print("Lenght :");
      print(BakeryData.length);
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
                    child: Text("เบเกอรี่",
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
                      itemCount: BakeryData == null ? 0 : BakeryData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemCard2(
                          title: "${BakeryData[index]["product_name"]}",
                          svgSrc: "${BakeryData[index]["img"]}",
                          press: () {
                            setState(() {
                              name = "${BakeryData[index]["product_name"]}";
                              price = "${BakeryData[index]["price"]}";
                              detail = "${BakeryData[index]["detail"]}";
                              img = "${BakeryData[index]["img"]}";
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

// class Bakery extends StatelessWidget {
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
//                     child: Text("เบเกอรี่",
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
//                         title: "เอแคลร์ นูเทลล่า",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/206af6d9e6c742239999ed24b0cd3997.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "แซนวิชครัวซองค์",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/3270a953e81246c58ef53626b5d4a2db.jpg",
//                         press: () {},
//                       ),
//                       // ItemCard(
//                       //   title: "Meditation",
//                       //   svgSrc: "assets/images/burger.png",
//                       //   press: () {
//                       //     Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(builder: (context) {
//                       //         return HomeScreen();
//                       //       }),
//                       //     );
//                       //   },
//                       // ),
//                       // ItemCard(
//                       //   title: "Yoga",
//                       //   svgSrc: "assets/images/burger.png",
//                       //   press: () {},
//                       // ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ]));
//   }
// }
