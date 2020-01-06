import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/model/recharge_amount_model.dart';

class VipTab extends StatefulWidget {
  int currentIndex = 1;
  List<RechargeAmountModel> list;
  Function onChange;
  VipTab({this.currentIndex, this.list, this.onChange, Key key})
      : super(key: key);

  @override
  _VipTabState createState() {
    return _VipTabState();
  }
}

class _VipTabState extends State<VipTab> {
  @override
  void initState() {
    print(this.widget.list);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List gradient = [
      [Color(0xffBAA6EA), Color(0xff7D67A5)],
      [Color(0xff94D2E9), Color(0xff45A3CD)],
      [Color(0xffEBD598), Color(0xffC9A238)]
    ];
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(
                0, ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30)),
            child: Text(
              "会员套餐",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(34),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _tabs(this.widget.currentIndex),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0, ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30)),
              width: double.infinity,
              height: ScreenUtil().setWidth(80),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(80)),
                  gradient: LinearGradient(
                      colors: gradient[this.widget.currentIndex])),
              child: Center(
                child: Text(
                  '立即开通',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(28),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _tabs(index) {
    List<Widget> list = [];
    this.widget.list.asMap().keys.forEach((f) {
      list.add(_item(f, f == this.widget.currentIndex));
    });
    return list;
  }

  onChange(index) {
    this.widget.onChange(index);
  }

  _item(index, flag) {
    RechargeAmountModel item = this.widget.list[index];
    List<int> _data = [0xffF6EFFF, 0xffE5F8FF, 0xffFDF7E2];
    List<int> _text = [0xff806BA8, 0xff44A1CD, 0xffC9A238];
    return GestureDetector(
      onTap: () {
        this.widget.onChange(index);
      },
      child: Card(
        elevation: 10,
        child: Stack(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(210),
              height: ScreenUtil().setWidth(178),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1,
                      color: flag
                          ? Theme.of(context).primaryColor
                          : Color(0xffffffff)),
                  color: flag ? Color(_data[index]) : Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    item.name,
                    style: TextStyle(
                        color: flag ? Color(_text[index]) : Colors.black54,
                        fontSize: ScreenUtil().setSp(30),
                        fontWeight: FontWeight.bold),
                  ),
                  RichText(
                      text: TextSpan(
                          text: '¥',
                          style: TextStyle(
                              fontFamily: 'Din',
                              fontSize: ScreenUtil().setSp(30),
                              color:
                                  flag ? Color(_text[index]) : Colors.black54),
                          children: [
                        TextSpan(
                            text: item.discount.substring(0, 4),
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(38),
                                fontWeight: FontWeight.w900,
                                color: flag
                                    ? Color(_text[index])
                                    : Colors.black54))
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
