import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/drawer_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EccommerceView extends StatefulWidget {
  const EccommerceView({Key? key}) : super(key: key);

  @override
  State<EccommerceView> createState() => _EccommerceViewState();
}

class _EccommerceViewState extends State<EccommerceView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> items = [
    'images/image-product-1.jpg',
    'images/image-product-2.jpg',
    'images/image-product-3.jpg'
    // Add more image URLs or assets as needed
  ];

  final CarouselOptions options = CarouselOptions(
    height: 350.0, // You can adjust this height if needed
    enlargeCenterPage: true,
    autoPlay: true,
    autoPlayCurve: Curves.fastOutSlowIn,
    enableInfiniteScroll: true,
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    viewportFraction: 1.0, // Set to 1.0 to take up the entire width
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Align(
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset("images/logo.svg"),
        ),
        // Add the 3-line menu button to the leading property
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
          onPressed: () {
            // Open the drawer when the menu button is tapped
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: items.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(item,
                        width: double.infinity, fit: BoxFit.fill),
                  );
                },
              );
            }).toList(),
            options: options,
          ),
          const SizedBox(height: 10),
          const Padding(
            padding:  EdgeInsets.only(left :20.0, top: 12.0),
            child:  Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("S N E A K E R  C O M P A N Y",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xffD8925C),
                          fontFamily: "KumbhSans",
                          fontWeight: FontWeight.w900)),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text("Fall Limited Edition Sneakers",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: "KumbhSans",
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          )
        ],
      ),
      // Add a Drawer to the Scaffold
      drawer: const DrawerIcons(),
    );
  }
}
