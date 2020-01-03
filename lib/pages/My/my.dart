import 'dart:ui' as prefix0;

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/pages/My/my_card.dart';
import 'package:mjgj/pages/My/my_function.dart';
import 'package:mjgj/pages/My/my_order.dart';

void main() => (runApp(My()));

class My extends StatefulWidget {
  @override
  _My createState() => _My();
}

class _My extends State<My> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
            '个人中心',
            style: TextStyle(color: Colors.black),
          )),
      body: Column(
        children: <Widget>[MyCard(), MyOrder(), MyFunction()],
      ),
    );
  }
}
