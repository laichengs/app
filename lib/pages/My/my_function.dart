import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFunction extends StatelessWidget {
  MyFunction({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(690),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
      child: Column(
        children: <Widget>[
          _title(),
          SizedBox(
            height: ScreenUtil().setWidth(20),
          ),
          _list()
        ],
      ),
    );
  }

  _title() {
    return Container(
      height: ScreenUtil().setWidth(100),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffdddddd)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '常用功能',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(34),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  _list() {
    return GridView.count(
      crossAxisCount: 4,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      childAspectRatio: 5 / 4.5,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/member/group.png',
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(20),
            ),
            Text(
              '我的拼团',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/member/convent.png',
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(20),
            ),
            Text(
              '卡券兑换',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/member/address.png',
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(20),
            ),
            Text(
              '地址管理',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/member/contact.png',
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(20),
            ),
            Text(
              '联系客服',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/member/manage.png',
              width: ScreenUtil().setWidth(48),
              height: ScreenUtil().setWidth(48),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(20),
            ),
            Text(
              '管理入口',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
            )
          ],
        ),
      ],
    );
  }
}
