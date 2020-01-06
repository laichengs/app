import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VipTop extends StatefulWidget {
  final currentIndex;
  VipTop({this.currentIndex, Key key}) : super(key: key);

  @override
  _VipTopState createState() {
    return _VipTopState();
  }
}

class _VipTopState extends State<VipTop> {
  List<String> data = [
    "images/vip-page/supreme.png",
    "images/vip-page/diamond.png",
    "images/vip-page/gold.png",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
      child: Column(
        children: <Widget>[
          Image.asset(
            data[this.widget.currentIndex],
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          _power()
        ],
      ),
    );
  }

  _power() {
    List<Map<String, String>> data = [
      {"title": '提前预约', "url": 'images/vip-page/order.png'},
      {"title": "专属客服", "url": 'images/vip-page/custom.png'},
      {"title": '服务折扣', "url": 'images/vip-page/discount.png'},
      {"title": '服务赠送', "url": 'images/vip-page/present.png'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(
              0, ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30)),
          child: Text(
            "会员特权",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(34),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: data.map((item) {
            return new Card(
              elevation: 1,
              child: Container(
                height: ScreenUtil().setWidth(158),
                width: ScreenUtil().setWidth(158),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      item['url'],
                      width: ScreenUtil().setWidth(66),
                      height: ScreenUtil().setWidth(66),
                    ),
                    Text(
                      item['title'],
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(26),
                          color: Color(0xff666666)),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
