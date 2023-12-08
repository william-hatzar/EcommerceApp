import 'dart:io';
import 'dart:convert';
import 'package:ecommerce_app/ecommerce_view.dart';
import 'package:flutter/material.dart';
import 'models/product_list.dart';
import 'drawer_icons.dart';

class ProductListView extends StatefulWidget {
  final String fileName;
  const ProductListView({Key? key, required this.fileName}) : super(key: key);

  @override
  _ProductListViewState createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  List<Product> products = [];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    try {
      final file = File('/Users/williamhatzar/workspace/TikTok/ecommerce_app/resources/${widget.fileName}.json');
      final contents = await file.readAsString();
      setState(() {
        products = parseProducts(contents);
      });
    } catch (e) {
      print('Error loading JSON data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      key: _scaffoldKey,
      drawer: const DrawerIcons(),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EccommerceView(
                          productName: products[index].productName,
                          images: products[index].images,
                          brand: products[index].brand,
                          description: products[index].description,
                          price: products[index].price,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    elevation: 1.0, // Reduced elevation
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0), // Adjusted padding
                      title: Text(
                        products[index].productName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        products[index].description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        '£${(products[index].price).toStringAsFixed(2)}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Hero(
                        tag: 'productImage${products[index].productName}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            products[index].images[0],
                            fit: BoxFit.cover,
                            width: 80.0,
                            height: 80.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              childCount: products.length,
            ),
          ),
        ],
      ),
    );
  }
}
