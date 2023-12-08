import 'dart:async';
import 'package:ecommerce_app/main_list.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer ( const Duration(milliseconds: 1500),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const ProductListView(fileName: "products")
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.yellow,
            borderRadius: BorderRadius.circular(100.0)
            ),
            child: const Align(
              alignment: Alignment.center,
              child: (
                  Text("Quick Kicks", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 40, fontFamily: "KumbhSans", fontWeight: FontWeight.w900))
              ),
            )
        ),
      ),
    );
  }
}