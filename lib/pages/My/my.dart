import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => (runApp(My()));

class My extends StatefulWidget {
  @override
  _My createState() => _My();
}

class _My extends State<My> {
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          width: ScreenUtil().setWidth(690),
          height: ScreenUtil().setWidth(300),
          child: Card(
            elevation: 30,
            semanticContainer: true,
            child: Text("332"),
          ),
        )
      ],
    );
  }
}
