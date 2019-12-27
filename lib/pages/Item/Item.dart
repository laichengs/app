import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/dao/item_classify_dao.dart';
import 'package:mjgj/dao/item_dao.dart';
import 'package:mjgj/model/item_classify_entity.dart';
import 'package:mjgj/model/item_entity.dart';
import 'package:mjgj/pages/Public/placehold_loading.dart';
import 'package:mjgj/pages/Public/search_box.dart';

void main() => (runApp(Item()));

class Item extends StatefulWidget {
  final String title;
  final bool isShow;
  final int id;
  Item({this.title, this.isShow = false, this.id});
  @override
  _Item createState() => _Item();
}

class _Item extends State<Item> {
  ItemData _data;

  _getData() async {
    print('/api/item/${widget.id}');
    ItemEntity model =
        await ItemDao().getItem('/api/item/${widget.id}', {"id": 6});
    setState(() {
      _data = model.data;
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return _data == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: Text(
                  widget.title,
                  style: TextStyle(color: Colors.black),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                brightness: Brightness.light,
                backgroundColor: Colors.white),
            body: Stack(
              children: <Widget>[
                MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView(children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: _data.mainImg.url,
                        fadeInDuration: Duration(milliseconds: 0),
                        fadeOutDuration: Duration(milliseconds: 0),
                        width: ScreenUtil().setWidth(750),
                        fit: BoxFit.fitWidth,
                      ),
                      Column(
                        children: _items(_data.detail),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(750),
                        height: ScreenUtil().setHeight(100) +
                            MediaQuery.of(context).padding.bottom,
                      )
                    ])),
                _button(context)
              ],
            ),
          );
  }

  _items(List<ItemDataDetail> imgs) {
    List<Widget> data = [];
    imgs.forEach((f) {
      print("22");
      data.add(CachedNetworkImage(
          fadeInDuration: Duration(milliseconds: 0),
          fadeOutDuration: Duration(milliseconds: 0),
          imageUrl: f.img.url,
          width: ScreenUtil().setWidth(750),
          fit: BoxFit.fitWidth));
    });
    return data;
  }

  _button(BuildContext context) {
    double _bottom = MediaQuery.of(context).padding.bottom;
    return Positioned(
//      left: ScreenUtil().setWidth(30),
//      right: ScreenUtil().setWidth(30),
      child: Container(
          width: ScreenUtil().setWidth(750),
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0,
              ScreenUtil().setWidth(30), _bottom != 0 ? _bottom : _bottom + 10),
          color: Colors.white,
          child: Container(
            width: ScreenUtil().setWidth(690),
            height: ScreenUtil().setWidth(100),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: MaterialButton(
              child: Text(
                "立即预约",
                style: TextStyle(
                    color: Colors.white, fontSize: ScreenUtil().setSp(32)),
              ),
            ),
          )),
      bottom: 0,
//      bottom: MediaQuery.of(context).padding.bottom + ScreenUtil().setWidth(0),
    );
  }
}
