import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/dao/vip_item_dao.dart';
import 'package:mjgj/dao/vip_list_dao.dart';
import 'package:mjgj/dao/vip_question_dao.dart';
import 'package:mjgj/model/discount_list_model.dart' as prefix0;
import 'package:mjgj/model/question_model.dart' as prefix1;
import 'package:mjgj/model/recharge_amount_model.dart';
import 'package:mjgj/pages/VipPage/vip_item.dart';
import 'package:mjgj/pages/VipPage/vip_tab.dart';
import 'package:mjgj/pages/VipPage/vip_top.dart';

class VipPage extends StatefulWidget {
  VipPage({Key key}) : super(key: key);

  @override
  _VipPageState createState() {
    return _VipPageState();
  }
}

class _VipPageState extends State<VipPage> {
  bool flag = false;
  List<RechargeAmountModel> data;
  List<prefix0.DiscountListModel> items;
  List<prefix1.QuestionModel> questions;
  int _currentIndex = 1;
  _getData() async {
    List<RechargeAmountModel> model =
        await VipListDao().getList("/get_recharge_amounts", {"id": 6});
    List<prefix0.DiscountListModel> itemModel =
        await VipItemDao().getDiscountItems("/item_type/discount", null);
    List<prefix1.QuestionModel> questionModel =
        await VipQuestionDao().getQuestions("/vip/question", null);
    setState(() {
      data = model;
      items = itemModel;
      questions = questionModel;
      flag = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onChange(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: flag == false
          ? Center(
              child: Text('加载中...'),
            )
          : Container(
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(30), 0, ScreenUtil().setWidth(30), 0),
              child: ListView(
                children: <Widget>[
                  VipTop(currentIndex: this._currentIndex),
                  VipTab(
                    currentIndex: this._currentIndex,
                    list: data,
                    onChange: onChange,
                  ),
                  VipItem(
                      currentIndex: this._currentIndex,
                      items: this.items,
                      id: data[this._currentIndex].id)
                ],
              ),
            ),
    );
  }
}
