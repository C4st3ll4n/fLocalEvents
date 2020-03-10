import 'package:flocalevents/ui/page/home/HomePage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: "Local Events",
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    scaffoldBackgroundColor: Colors.white
  ),
  home: HomePage(),
));
