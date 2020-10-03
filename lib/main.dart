import 'package:flutter/material.dart';
import 'package:flutter_cocktail/homepage.dart';

const Color myColor = Colors.blue;
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cocktail App",
      theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Colors.cyan,
          buttonTheme: ButtonThemeData(buttonColor: Colors.cyan)),
      home: HomePage(),
    );
  }
}
