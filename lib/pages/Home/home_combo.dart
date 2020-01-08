import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/model/theme_model.dart' as prefix0;
import 'package:mjgj/pages/Item/Item.dart';

class HomeCombo extends StatelessWidget {
  final List<prefix0.Item> comboList;
  final String title;
  HomeCombo(this.title, this.comboList);
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          height: ScreenUtil().setWidth(390),
          padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _item(context, comboList),
          ),
        )
      ],
    );
  }

  //获取单个
  _item(BuildContext context, List comboList) {
    List<Widget> items = [];
    for (var item in comboList) {
      items.add(_singleItem(context, item));
    }
    return items;
  }

  _singleItem(BuildContext context, data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "/item",
            arguments: {"id": data.itemId, "title": data.title});
      },
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Color(int.parse('0xfff4f4f4'))),
            width: ScreenUtil().setWidth(210),
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(30)),
            padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
            child: Image.network(
              data.img.url,
              width: ScreenUtil().setWidth(150),
              height: ScreenUtil().setWidth(150),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(210),
            margin: EdgeInsets.fromLTRB(
                0, ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20)),
            child: Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(24),
                  color: Color(int.parse('0xff666666'))),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  '¥',
                  style: TextStyle(
                      fontFamily: 'Din', color: Theme.of(context).primaryColor),
                ),
                Text('${data.price}',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30),
                        fontFamily: 'Din',
                        color: Theme.of(context).primaryColor)),
                Container(
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                  child: Text(
                    '¥${data.originalPrice}',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(22),
                        fontFamily: 'Din',
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.black38,
                        color: Colors.black38),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
