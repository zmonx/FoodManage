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

class Ice extends StatefulWidget {
  @override
  _IceState createState() => _IceState();
}

class _IceState extends State<Ice> {
  @override
  Map data;
  List IceData;
  String name;
  String price;
  String detail;
  String img;
  getProducts() async {
    http.Response response =
        await http.get('http://192.168.1.2:8000/category8');
    // debugPrint(response.body);
    data = json.decode(response.body);
    // debugPrint('test');

    setState(() {
      IceData = data['products'];
      print("Lenght :");
      print(IceData.length);
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
                      itemCount: IceData == null ? 0 : IceData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemCard2(
                          title: "${IceData[index]["product_name"]}",
                          svgSrc: "${IceData[index]["img"]}",
                          press: () {
                            setState(() {
                              name = "${IceData[index]["product_name"]}";
                              price = "${IceData[index]["price"]}";
                              detail = "${IceData[index]["detail"]}";
                              img = "${IceData[index]["img"]}";
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

// class Ice extends StatelessWidget {
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
//                     child: Text("ไอศกรีม",
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
//                       ItemCard(
//                         title: "Diet Recommendation",
//                         svgSrc: "assets/images/burger.png",
//                         press: () {},
//                       ),
//                       ItemCard(
//                         title: "Kegel Exercises",
//                         svgSrc: "assets/images/burger.png",
//                         press: () {},
//                       ),
//                       ItemCard(
//                         title: "Meditation",
//                         svgSrc: "assets/images/burger.png",
//                         press: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) {
//                               return HomeScreen();
//                             }),
//                           );
//                         },
//                       ),
//                       ItemCard(
//                         title: "Yoga",
//                         svgSrc: "assets/images/burger.png",
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
