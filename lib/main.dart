import 'package:flutter/material.dart';
import 'package:practica_figma/screens/check_out.dart';
import 'package:practica_figma/screens/home_screen.dart';
import 'package:practica_figma/screens/productDetail_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light().copyWith(scaffoldBackgroundColor: Colors.white),
      //darkTheme: ThemeData.dark(),
      routes: {
        '/homeScreen': (context) => const HomeScreen(),
        '/productDetail': (context) => const ProductDetailPage(),
        '/checkOut': (context) => const CheckoutPage(),
      },
      title: 'Figma Challenge',
    );
  }
}
