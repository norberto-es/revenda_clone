import 'package:flutter/material.dart';
import 'package:revenda_clone/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escolha uma Revenda',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
      home: HomePage(),
    );
  }
}
