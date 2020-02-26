import 'package:flutter/material.dart';
import 'package:planets_flutter_app/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planets',
      home: HomePage(),
    );
  }
}
