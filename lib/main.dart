import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/nav/nav.dart';

void main() => (runApp(App()));

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.white,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            primaryColor: Color(int.parse('0xffe03a51')),
            brightness: null),
        home: Nav());
  }
}
