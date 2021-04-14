import 'package:bigbag/controllers/firebase_controller.dart';
import 'package:bigbag/views/trending.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color primaryColor = Color(0xFFdc3545);
  final Color listTileColor = Color(0xfffbf2f2);

  int _currentIndex = 0;
  final List _imageList = [
    "assets/apple.jpg",
    "assets/headphone.jpg",
    "assets/cosmetics.jpg"
  ];

  final List _offerList = [
    "assets/offer_1.jpg",
    "assets/offer_2.jpg",
    "assets/offer_3.jpg",
    "assets/offer_4.jpg",
  ];

  List<Tile> map<Tile>(List list, Function function) {
    List<Tile> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(function(i, list[i]));
    }
    return result;
  }
final cont = Get.put(FirebaseController());
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor),
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.menu,
                                  size: 25,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Top Categories",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            trailing: Icon(null),
                            children:

                              <Widget>[
                                ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  itemCount: cont.categorys.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      height: 40,
                                      child: Center(
                                        
                                        child:  Column(
                                          children: [
                                            Text(cont.categorys[index].name, textAlign: TextAlign.justify,),
                                            Divider(
                                              height: 1,
                                              color: Colors.grey[400],
                                            ),
                                          ],

                                        ),
                                      )
                                    )  ;


                                      // Text(cont.categorys[index].name);
                                    // Divider(
                                    // height: 1,
                                    // color: Colors.grey[400],
                                    // ),
                                  },
                                  shrinkWrap: true,
                                )
                                ]

                            // children: [
                            //   listTile("Electronic Devices"),
                            //   Divider(
                            //     height: 1,
                            //     color: Colors.grey[400],
                            //   ),
                            //   listTile("Electronic Accesories"),
                            //   Divider(
                            //     height: 1,
                            //     color: Colors.grey[400],
                            //   ),
                            //   listTile("TV & Home Applinces"),
                            //   Divider(
                            //     height: 1,
                            //     color: Colors.grey[400],
                            //   ),
                            //   listTile("Health & Beauty"),
                            //   Divider(
                            //     height: 1,
                            //     color: Colors.grey[400],
                            //   ),
                            //   listTile("Babies & Toys"),
                            //   Divider(
                            //     height: 1,
                            //     color: Colors.grey[400],
                            //   ),
                            //   listTile("Groceries & Pets"),
                            //   Divider(
                            //     height: 1,
                            //     color: Colors.grey[400],
                            //   ),
                            //   listTile("Home & Lifestyle"),
                            //   Divider(
                            //     height: 1,
                            //     color: Colors.grey[400],
                            //   ),
                            //   listTile("Watches & Accesories"),
                            // ],
                          )),
                      SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          CarouselSlider(
                            items: _imageList.map((image) {
                              return Builder(builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(image),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                );
                              });
                            }).toList(),
                            options: CarouselOptions(
                                enlargeCenterPage: true,
                                autoPlay: true,
                                autoPlayCurve: Curves.easeInOut,
                                autoPlayInterval: Duration(seconds: 3),
                                viewportFraction: 1,
                                autoPlayAnimationDuration:
                                    Duration(milliseconds: 800),
                                initialPage: 0,
                                onPageChanged: (index, _) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                                height: 160),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 50,
                            left: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                                  map<Widget>(_imageList, (index, directory) {
                                return Container(
                                  width: 35,
                                  height: 8,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: _currentIndex == index
                                          ? primaryColor
                                          : Colors.white),
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CarouselSlider(
                          items: _offerList
                              .map((offer) =>
                                  Builder(builder: (BuildContext build) {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(offer),
                                            fit: BoxFit.fill,
                                          ),
                                        ));
                                  }))
                              .toList(),
                          options: CarouselOptions(
                            height: 150,
                            enlargeCenterPage: true,
                            viewportFraction: 1,
                            initialPage: 0,
                          ))
                    ],
                  ),
                ),
              ),
              title("Trending products", TrendingPage()),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Container(
                        height: double.infinity,
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  "assets/apple.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Electronic Devices",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black54)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "iPhone Xs",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$799",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_border_sharp,
                                          color: Colors.yellow,
                                        ),
                                        Text("(6)"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
              title("Best selling products", TrendingPage()),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Container(
                        height: double.infinity,
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  "assets/headphone.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Electronic Accesories",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black54)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Beats headphone",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$199",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_border_sharp,
                                          color: Colors.yellow,
                                        ),
                                        Text("(15)"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
              title("New arrival products", TrendingPage()),
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 10,
                      child: Container(
                        height: double.infinity,
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  "assets/cosmetics.jpg",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Health & Beauty",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black54)),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "Chamomile facewash",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$29",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star_border_sharp,
                                          color: Colors.yellow,
                                        ),
                                        Text("(6)"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ));
  }

  Widget listTile(String title) {
    return Container(
      width: double.infinity,
      height: 50,
      color: listTileColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54),
          ),
        ),
      ),
    );
  }

  Widget title(String text, Widget page) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          InkWell(
            onTap: () {
              Get.to(() => page);
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: primaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: primaryColor,
                      size: 15,
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                          fontSize: 10),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
