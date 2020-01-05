import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/model/discount_list_model.dart';

class VipItem extends StatefulWidget {
  int currentIndex;
  List items;
  int id;
  bool flag = false;
  VipItem({this.currentIndex, this.items, this.id, Key key}) : super(key: key);

  @override
  _VipItemState createState() {
    return _VipItemState();
  }
}

class _VipItemState extends State<VipItem> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(
                0, ScreenUtil().setWidth(0), 0, ScreenUtil().setWidth(30)),
            child: Text(
              "折扣项目",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(34),
              ),
            )),
        _title(),
        _list(),
        _tip()
      ],
    );
  }

  _title() {
    List<int> _text = [0xff806BA8, 0xff44A1CD, 0xffC9A238];
    return Container(
      decoration: BoxDecoration(color: Color(_text[this.widget.currentIndex])),
      height: ScreenUtil().setWidth(80),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Text(
              "服务项目",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(28)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text("原价",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28))),
          ),
          Expanded(
            flex: 2,
            child: Text("折扣价",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(28))),
          )
        ],
      ),
    );
  }

  _list() {
    List items =
        this.widget.flag ? this.widget.items : this.widget.items.sublist(0, 6);
    int index = this.widget.currentIndex;
    return Column(
      children: items.map((f) {
        return _item(f);
      }).toList(),
    );
  }

  _tip() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: ScreenUtil().setWidth(80),
          child: GestureDetector(
            onTap: () {
              setState(() {
                this.widget.flag = !this.widget.flag;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(this.widget.flag ? '收起' : '查看更多'),
                Icon(this.widget.flag
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down)
              ],
            ),
          ),
        ),
        Text(
          "注：除以上服务项目外，平台其它项目不参与折扣优惠。",
          style: TextStyle(
              fontSize: ScreenUtil().setSp(24), color: Color(0xff999999)),
        )
      ],
    );
  }

  Widget _item(DiscountListModel item) {
    return Container(
//      height: ScreenUtil().setWidth(80),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: Container(
                height: ScreenUtil().setWidth(70),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black54),
                        left: BorderSide(width: 0.5, color: Colors.black54),
                        right: BorderSide(width: 0.5, color: Colors.black54))),
                child: Center(
                  child: Text(item.name),
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              height: ScreenUtil().setWidth(70),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.black54),
                      right: BorderSide(width: 0.5, color: Colors.black54))),
              child: Center(
                child: Text(item.price.substring(0, item.price.indexOf('.')) +
                    '元/' +
                    item.unit),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: ScreenUtil().setWidth(70),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.black54),
                      right: BorderSide(width: 0.5, color: Colors.black54))),
              child: Center(child: () {
                int _price;
                item.list1.forEach((f) {
                  if (f.id == this.widget.id) {
                    _price = f.price;
                  } else {}
                });
                return Text('$_price' + '元/' + item.unit);
              }()),
            ),
          )
        ],
      ),
    );
  }
}
