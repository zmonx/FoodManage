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

class Dessert extends StatefulWidget {
  @override
  _DessertState createState() => _DessertState();
}

class _DessertState extends State<Dessert> {
  @override
  Map data;
  List DessertData;
  getProducts() async {
    http.Response response =
        await http.get('http://192.168.1.2:8000/category6');
    // debugPrint(response.body);
    data = json.decode(response.body);
    // debugPrint('test');

    setState(() {
      DessertData = data['products'];
      print("Lenght :");
      print(DessertData.length);
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
                    child: Text("ของหวาน",
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
                      itemCount: DessertData == null ? 0 : DessertData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemCard2(
                          title: "${DessertData[index]["product_name"]}",
                          svgSrc: "${DessertData[index]["img"]}",
                          press: () {},
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

// class Dessert extends StatelessWidget {
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
//                     child: Text("ของหวาน",
//                         style: Theme.of(context)
//                             .textTheme
//                             .display1
//                             .merge(GoogleFonts.kanit())
//                             .copyWith(
//                               color: Colors.white,
//                             )),
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
