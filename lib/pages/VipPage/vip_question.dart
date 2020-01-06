import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/model/question_model.dart';

class VipQuestion extends StatelessWidget {
  List<QuestionModel> questions;
  VipQuestion({this.questions, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(
                0, ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30)),
            child: Text(
              "常见问题",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(34),
              ),
            )),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: questions.asMap().keys.map((f) {
              return _items(f, questions[f]);
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _items(int index, QuestionModel item) {
    return Padding(
      padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "${index + 1}.${item.question}",
            style: TextStyle(
              height: 2,
            ),
          ),
          Text('${item.answer}',
              style: TextStyle(
                height: 2,
                color: Color(0xff999999),
              ))
        ],
      ),
    );
  }
}
