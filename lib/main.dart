import 'dart:ui';

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/nav/nav.dart';
import 'package:mjgj/pages/My/my.dart';
import 'package:mjgj/router/router.dart';
import 'package:mjgj/router/router.dart' as prefix0;

void main() => (runApp(App()));

class App extends StatefulWidget {
  @override
  _App createState() => _App();
}

class _App extends State<App> {
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: prefix0.onGenerateRoute,
        initialRoute: "/vip",
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              color: Colors.white,
              brightness: Brightness.light,
              iconTheme: IconThemeData(color: Colors.black),
            ),
            primaryColor: Color(int.parse('0xffe03a51')),
            brightness: null),
       );
  }
}
