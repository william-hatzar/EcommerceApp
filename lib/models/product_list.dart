import 'dart:convert';

class Product {
  String brand;
  String productName;
  String description;
  double price;
  double discount;
  List<String> images;

  Product({
    required this.brand,
    required this.productName,
    required this.description,
    required this.price,
    required this.discount,
    required this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      brand: json['brand'],
      productName: json['productName'],
      description: json['description'],
      price: json['price'].toDouble(),
      discount: json['discount'].toDouble(),
      images: List<String>.from(json['images'].map((image) => image['url'])),
    );
  }
}

List<Product> parseProducts(String jsonStr) {
  final List<dynamic> parsedJson = json.decode(jsonStr)['products'];
  return parsedJson.map((json) => Product.fromJson(json)).toList();
}
