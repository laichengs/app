import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/model/theme_model.dart';
import 'package:mjgj/pages/Public/placehold_loading.dart';

class HomeRecharge extends StatelessWidget {
  final List<Item> rechargeList;
  final String title;
  HomeRecharge(this.title, this.rechargeList);
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      FractionallySizedBox(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(30),
              ScreenUtil().setWidth(10),
              ScreenUtil().setWidth(30),
              ScreenUtil().setWidth(10)),
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(36),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _items(rechargeList[0].title, rechargeList[0].describe,
                    rechargeList[0].img.url, false),
                _items(rechargeList[1].title, rechargeList[1].describe,
                    rechargeList[1].img.url, false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _items(rechargeList[2].title, rechargeList[2].describe,
                    rechargeList[2].img.url, true),
                _items(rechargeList[3].title, rechargeList[3].describe,
                    rechargeList[3].img.url, true),
              ],
            )
          ],
        ),
      )
    ]);
  }
}

class _items extends StatelessWidget {
  final String title;
  final String describe;
  final String img;
  final bool isBottom;
  _items(this.title, this.describe, this.img, this.isBottom);
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isBottom ? ScreenUtil().setWidth(30) : 0),
      padding: EdgeInsets.all(
        ScreenUtil().setWidth(20),
      ),
      height: ScreenUtil().setWidth(145),
      width: ScreenUtil().setWidth(330),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Color(int.parse("0xfff4f4f4")),
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                  child: Text(describe,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(24),
                          color: Color(int.parse("0xff999999")))))
            ],
          ),
          CachedNetworkImage(
            imageUrl: img,
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setWidth(100),
            fit: BoxFit.fitWidth,
            placeholder: (context, url) => PlaceholderLoading(100, 100),
          )
//          Image.network(
//            img,
//            width: ScreenUtil().setWidth(100),
//            fit: BoxFit.fill,
//          )
        ],
      ),
    );
  }
}
