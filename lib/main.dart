import 'package:app_lanchonete/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.orange, scaffoldBackgroundColor: Colors.white),
      home: const Home(),
    ),
  );
}
