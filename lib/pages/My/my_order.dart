import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrder extends StatelessWidget {
  MyOrder({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(690),
      margin: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: ScreenUtil().setWidth(20),
          ),
          _orderTitle(),
          _orderList()
        ],
      ),
    );
  }

  _orderTitle() {
    return Container(
      height: ScreenUtil().setWidth(100),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffdddddd)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '我的订单',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(34),
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
              child: Row(
            children: <Widget>[
              Text(
                '查看全部订单',
                style: TextStyle(
                    color: Color(0xff999999), fontSize: ScreenUtil().setSp(28)),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(20),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: ScreenUtil().setSp(28),
                color: Color(0xff999999),
              )
            ],
          ))
        ],
      ),
    );
  }

  _orderList() {
    return Container(
      height: ScreenUtil().setWidth(200),
//      decoration: BoxDecoration(color: Colors.red),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/member/order@nopay.png',
                width: ScreenUtil().setWidth(56),
                height: ScreenUtil().setWidth(56),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(20),
              ),
              Text(
                '待付款',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/member/order@pay.png',
                width: ScreenUtil().setWidth(56),
                height: ScreenUtil().setWidth(56),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(20),
              ),
              Text(
                '待服务',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/member/order@server.png',
                width: ScreenUtil().setWidth(56),
                height: ScreenUtil().setWidth(56),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(20),
              ),
              Text(
                '已服务',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/member/order@cancel.png',
                width: ScreenUtil().setWidth(56),
                height: ScreenUtil().setWidth(56),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(20),
              ),
              Text(
                '已取消',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28), color: Color(0xff666666)),
              )
            ],
          ),
        ],
      ),
    );
  }
}
