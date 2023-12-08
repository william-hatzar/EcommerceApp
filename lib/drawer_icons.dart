import 'package:ecommerce_app/main_list.dart';
import 'package:flutter/material.dart';

class DrawerIcons extends StatelessWidget {
  const DrawerIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 50),
          ListTile(
            title: const Text('X', style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black),),
            onTap: () {
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Shoes', style: TextStyle(fontFamily: "Kumbh Sans", fontWeight: FontWeight.bold, fontSize:20),),
            onTap: () {
              // Handle Men tap
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductListView(fileName: "products")));
              // Add code to navigate to Men
            },
          ),
          ListTile(
            title: Text('Clothing', style: TextStyle(fontFamily: "Kumbh Sans", fontWeight: FontWeight.bold, fontSize:20)),
            onTap: () {
              // Handle Women tap
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductListView(fileName: "clothing"))); // Close the drawer
              // Add code to navigate to Women
            },
          ),
          ListTile(
            title: Text('About', style: TextStyle(fontFamily: "Kumbh Sans", fontWeight: FontWeight.bold, fontSize:20)),
            onTap: () {
              // Handle About tap
              Navigator.pop(context); // Close the drawer
              // Add code to navigate to About
            },
          ),
          ListTile(
            title: Text('Contact', style: TextStyle(fontFamily: "Kumbh Sans", fontWeight: FontWeight.bold, fontSize:20)),
            onTap: () {
              // Handle Contact tap
              Navigator.pop(context); // Close the drawer
              // Add code to navigate to Contact
            },
          ),
        ],
      ),
    );
  }
}
