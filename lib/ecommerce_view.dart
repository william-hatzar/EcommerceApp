import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/drawer_icons.dart';
import 'package:flutter/material.dart';

class EccommerceView extends StatefulWidget {
  final String productName;
  final List<String> images;
  final String brand;
  final String description;
  final double price;

  const EccommerceView({
    Key? key,
    required this.productName,
    required this.images,
    required this.brand,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  State<EccommerceView> createState() => _EccommerceViewState();
}

class _EccommerceViewState extends State<EccommerceView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Constants constants = Constants();
  final CarouselOptions options = CarouselOptions(
    height: 350.0,
    enlargeCenterPage: true,
    autoPlay: true,
    autoPlayCurve: Curves.fastOutSlowIn,
    enableInfiniteScroll: true,
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    autoPlayInterval: Duration(milliseconds: 1200),
    viewportFraction: 1.0,
  );

  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.amber[400], // Subdued yellow color
        elevation: 0.0,
        title: const Text(
          "Quick Kicks",
          style: TextStyle(fontFamily: "KumbhSans", color: Colors.white, fontWeight: FontWeight.w900),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        actions: [
          // Add a basket icon
          IconButton(
            icon: const Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            onPressed: () {
              // Handle basket icon press
            },
          ),
          const SizedBox(width: 16), // Adjust the spacing as needed
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: widget.images.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(item, width: double.infinity, fit: BoxFit.fill),
                    );
                  },
                );
              }).toList(),
              options: options,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.brand,
                    style: const TextStyle(fontSize: 16, color: Colors.red, fontFamily: "KumbhSans", fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.productName,
                    style: const TextStyle(fontSize: 28, color: Colors.black, fontFamily: "KumbhSans", fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 14, color: Colors.grey, fontFamily: "KumbhSans", fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "£${widget.price.toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: "KumbhSans", fontSize: 24, color: Colors.blue),
                      ),
                      // Quantity Selection
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (_quantity > 1) {
                                  _quantity--;
                                }
                              });
                            },
                            icon: const Icon(Icons.remove),
                            color: Colors.amber[400], // Subdued yellow color
                          ),
                          Text(
                            '$_quantity',
                            style: TextStyle(fontFamily: "KumbhSans", fontSize: 18, color: Colors.amber[400]), // Subdued yellow color
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                            icon: const Icon(Icons.add),
                            color: Colors.amber[400], // Subdued yellow color
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Buy Now Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle buy now button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    ),
                    child: const Text(
                      "Add to basket",
                      style: TextStyle(fontFamily: "KumbhSans", fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerIcons(),
    );
  }
}
