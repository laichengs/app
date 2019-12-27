import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeRecommend extends StatelessWidget {
  final List recommendList;
  final String title;
  HomeRecommend(this.title, this.recommendList);
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _getList(context),
      ),
    );
  }

  _getList(BuildContext context) {
    List<Widget> data = [];
    data.add(FractionallySizedBox(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(0),
            ScreenUtil().setWidth(10),
            ScreenUtil().setWidth(30),
            ScreenUtil().setWidth(10)),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: ScreenUtil().setWidth(36), fontWeight: FontWeight.bold),
        ),
      ),
    ));
    for (var item in recommendList) {
      data.add(_getItem(context, item));
    }
    return data;
  }

  _getItem(BuildContext context, item) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          0, ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30)),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffeeeeee)))),
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
            decoration: BoxDecoration(color: Color(0xffeeeeee)),
            child: Image.network(
              item.img.url,
              width: ScreenUtil().setWidth(150),
              height: ScreenUtil().setWidth(120),
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            flex: 1,
            child: _getDescribe(context, item),
          )
        ],
      ),
    );
  }

  _getDescribe(BuildContext context, item) {
    return Container(
      height: ScreenUtil().setWidth(180),
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(30)),
//              color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${item.title}',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(32),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(6)),
                child: Text(
                  '${item.describe}',
                  style: TextStyle(
                      color: Color(0xff999999),
                      fontSize: ScreenUtil().setWidth(24)),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '¥',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        fontFamily: 'Din',
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  Text('${item.price}',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(36),
                          fontFamily: 'Din',
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold)),
                  Text('元起',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold))
                ],
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      ScreenUtil().setWidth(20),
                      ScreenUtil().setWidth(10),
                      ScreenUtil().setWidth(20),
                      ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                          width: 1, color: Theme.of(context).primaryColor)),
                  child: Text(
                    '立即体验',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: ScreenUtil().setSp(24)),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
