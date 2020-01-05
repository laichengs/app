import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBox extends StatefulWidget {
  final String title;
  final bool isShow;

  SearchBox(this.title, this.isShow);

  @override
  State createState() => _searchBox();
}

class _searchBox extends State<SearchBox> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: Color(0xfff1f1f1),
              borderRadius: BorderRadius.circular(30)),
          width: ScreenUtil().setWidth(690),
          height: ScreenUtil().setWidth(70),
          margin: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(30), ScreenUtil().setWidth(30), 0, 0),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.search,
                color: Color(0xff666666),
              ),
              Text(
                widget.title,
                style: TextStyle(color: Color(0xff666666)),
              )
            ],
          ),
        )
      ],
    );
  }
}
