import 'dart:ui' as prefix0;

import "package:flutter/material.dart";
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => (runApp(MyCard()));

class MyCard extends StatefulWidget {
  @override
  _MyCard createState() => _MyCard();
}

class _MyCard extends State<MyCard> {
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
      width: ScreenUtil().setWidth(690),
      height: ScreenUtil().setWidth(300),
      child: Stack(
        children: <Widget>[
          Image.asset('images/member/card@normal.png'),
          _userInfo(),
          _account()
        ],
      ),
    );
  }

  _userInfo() {
    return Positioned(
      left: ScreenUtil().setWidth(30),
      top: ScreenUtil().setWidth(30),
      child: Row(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              'images/member/user_default.png',
              width: ScreenUtil().setWidth(92),
              height: ScreenUtil().setWidth(92),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(30),
          ),
          Text(
            '立即登录',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(32), color: Colors.white),
          )
        ],
      ),
    );
  }

  _account() {
    return Positioned(
      bottom: ScreenUtil().setWidth(30),
      child: Container(
        width: ScreenUtil().setWidth(690),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  '0',
                  style: TextStyle(
                      fontFamily: 'Din',
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(32),
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(10),
                ),
                Text(
                  '余额',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setWidth(24)),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '1673',
                  style: TextStyle(
                      fontFamily: 'Din',
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(32),
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(10),
                ),
                Text(
                  '余额',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setWidth(24)),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                  '2',
                  style: TextStyle(
                      fontFamily: 'Din',
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(32),
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(10),
                ),
                Text(
                  '余额',
                  style: TextStyle(
                      color: Colors.white, fontSize: ScreenUtil().setWidth(24)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
