import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/dao/item_classify_dao.dart';
import 'package:mjgj/model/item_classify_entity.dart';
import 'package:mjgj/pages/Item/Item.dart';
import 'package:mjgj/pages/Public/placehold_loading.dart';
import 'package:mjgj/pages/Public/search_box.dart';

void main() => (runApp(Category()));

class Category extends StatefulWidget {
  final String title;
  final bool isShow;
  Category({this.title, this.isShow = false});
  @override
  _Category createState() => _Category();
}

class _Category extends State<Category> {
  int _currentIndex = 0;
  List _data = [];
  List menu = ['苹果', '橘子', '香蕉', '梨子', '山竹'];

  _getData() async {
    ItemClassifyEntity model = await ItemClassifyDao()
        .getItemClassify('/api/item_classify', {"id": 6});
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
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(20)),
            child: SearchBox('空调清洗', false),
          ),
          Expanded(
            flex: 1,
            child: _data == null || _data.length == 0
                ? Center(
                    child: Text('加载中...'),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: _getLift(_data),
                      ),
                      Expanded(
                        flex: 3,
                        child: _data == null
                            ? Text('加载')
                            : _getRight(_data[_currentIndex]),
                      )
                    ],
                  ),
          )
        ],
      ),
    );
  }

  _getLift(List menu) {
    return FractionallySizedBox(
        heightFactor: 1,
        child: Container(
          decoration: BoxDecoration(color: Color(0xfff4f4f4)),
          child: ListView(
            shrinkWrap: true,
            children: _getLiftItem(menu),
          ),
        ));
  }

  _getLiftItem(List menu) {
    List<Widget> data = [];
    print(_data.length);
    for (var i = 0; i < _data.length; i++) {
      data.add(GestureDetector(
        onTap: () {
          setState(() {
            _currentIndex = i;
          });
        },
        child: FractionallySizedBox(
          child: i != _currentIndex
              ? Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setWidth(80),
                  decoration: BoxDecoration(color: Color(0xfff1f1f1)),
                  child: Text('${_data[i].title}',
                      style: TextStyle(color: Color(0xff999999))),
                )
              : Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setWidth(80),
                  decoration: BoxDecoration(color: Color(0xfff8f8f8)),
                  child: Text('${_data[i].title}',
                      style: TextStyle(color: Color(0xffe03a51))),
                ),
        ),
      ));
    }
    return data;
  }

  _getRight(data) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: CachedNetworkImage(
              imageUrl: data.img.url,
              fadeInDuration: Duration(milliseconds: 0),
              fadeOutDuration: Duration(milliseconds: 0),
              placeholder: (context, url) => PlaceholderLoading(300, 140),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(30)),
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: ScreenUtil().setWidth(20),
              mainAxisSpacing: ScreenUtil().setWidth(20),
              shrinkWrap: true,
              children: _getRightItems(data.item),
            ),
          )
        ],
      ),
    );
  }

  _getRightItems(List items) {
    List<Widget> data = [];
    for (var i = 0; i < items.length; i++) {
      data.add(Container(
        child: GestureDetector(
          onTap: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) =>
//                        Item(id: items[i].id, title: items[i].name)));
          },
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 0),
                  fadeOutDuration: Duration(milliseconds: 0),
                  width: ScreenUtil().setWidth(100),
                  imageUrl: items[i].realImg.url,
                  placeholder: (context, url) {
                    return Container(
                      width: ScreenUtil().setWidth(100),
                      height: ScreenUtil().setWidth(100),
                      decoration: BoxDecoration(color: Color(0xfff6f6f6)),
                    );
                  }),
              Container(
                width: ScreenUtil().setWidth(180),
                alignment: Alignment.center,
                child: Text(
                  '${items[i].name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Color(0xff666666),
                      fontSize: ScreenUtil().setSp(24)),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return data;
  }
}
