import 'package:flutter/material.dart';

import 'home.dart';

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
