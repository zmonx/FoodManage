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

class Drink extends StatefulWidget {
  @override
  _DrinkState createState() => _DrinkState();
}

class _DrinkState extends State<Drink> {
  @override
  Map data;
  List DrinkData;
  String name;
  String price;
  String detail;
  String img;

  getProducts() async {
    http.Response response =
        await http.get('http://192.168.1.2:8000/category3');
    // debugPrint(response.body);
    data = json.decode(response.body);
    // debugPrint('test');

    setState(() {
      DrinkData = data['products'];
      // print("Lenght :");
      // print(DrinkData.length);
    });
  }

  // Future<http.Response> testapi(var id) async {
  //   final http.Response response = await http.post(
  //     Uri.parse('http://192.168.1.2:8000/testapi/$id'),
  //     headers: <var, var>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode({
  //       "objectid": id,
  //     }),
  //   );
  // }

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
                    child: Text("?????????????????????????????????",
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
                      itemCount: DrinkData == null ? 0 : DrinkData.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return ItemCard2(
                          title: "${DrinkData[index]["product_name"]}",
                          svgSrc: "${DrinkData[index]["img"]}",
                          press: () {
                            setState(() {
                              name = "${DrinkData[index]["product_name"]}";
                              price = "${DrinkData[index]["price"]}";
                              detail = "${DrinkData[index]["detail"]}";
                              img = "${DrinkData[index]["img"]}";
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

// class Drink extends StatelessWidget {
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
//                     child: Text("?????????????????????????????????",
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
//                         title: "???????????????????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/2155081a54d440c683fc7940cc0525f3.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/7eb7d4ad7eae4220885d0ad19b26671d.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "??????????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/b329050339564e5f88fd4272c5a64f23.jpg",
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
//                         title: "????????????????????????????????????????????????????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/119a7e800e554f3883be210800bddb13.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "???????????????????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/6ff81481aa204d188844f92a11c3d3ce.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "?????????????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/101ec4613815401ba1e50e707de9ee79.jpg",
//                         press: () {},
//                       ),
//                       ItemCard2(
//                         title: "????????????????????????????????? ????????????????????????????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/2e07fb06bd27436fb11233e3c64c4244.jpg",
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
//                         title: "????????????????????????????????????????????????",
//                         svgSrc:
//                             "https://7elevenweb.s3.ap-southeast-1.amazonaws.com/product/32681f8b38e34bebbeb69d7133b65b95.jpg",
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
