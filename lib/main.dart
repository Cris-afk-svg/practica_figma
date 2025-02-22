import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Material App Bar')),
        body: Row(
          children: [
            const Center(
              child: Text(
                'Texto de Prueba',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Encode',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Center(child: Image.asset('assets/images/p3.png')),
          ],
        ),
      ),
    );
  }
}
