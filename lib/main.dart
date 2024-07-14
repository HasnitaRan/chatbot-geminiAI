import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'home_page.dart';

void main() {
  Gemini.init(apiKey:"AIzaSyC4eqZdvgI17VDURz7RBH77h37G6HZLgjo");
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
  ));
}
