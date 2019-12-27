import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/pages/Public/placehold_loading.dart';

class HomeCategory extends StatelessWidget {
  final List categoryList;
  HomeCategory(this.categoryList);
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 10),
//        height: ScreenUtil().setHeight(260),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: categoryList.asMap().keys.map((f) {
              return new Container(
                  child: new Column(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: categoryList[f].img.url,
                    fadeInDuration: Duration(milliseconds: 0),
                    fadeOutDuration: Duration(milliseconds: 0),
                    height: ScreenUtil().setHeight(90),
                    width: ScreenUtil().setWidth(90),
                    placeholder: (context, url) => PlaceholderLoading(90, 90),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        "${categoryList[f].title}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(28),
                            color: Color(int.parse('0xff666666'))),
                      ))
                ],
              ));
            }).toList(),
          ),
        ));
  }
}
