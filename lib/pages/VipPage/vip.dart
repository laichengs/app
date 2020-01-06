import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/dao/vip_item_dao.dart';
import 'package:mjgj/dao/vip_list_dao.dart';
import 'package:mjgj/dao/vip_question_dao.dart';
import 'package:mjgj/model/discount_list_model.dart' as prefix0;
import 'package:mjgj/model/question_model.dart' as prefix1;
import 'package:mjgj/model/recharge_amount_model.dart';
import 'package:mjgj/pages/VipPage/vip_item.dart';
import 'package:mjgj/pages/VipPage/vip_question.dart';
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
  double op = 0;
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

  bool _onNotification(scrollNotification) {
    int appbar = 100;
    double scale;
    if (scrollNotification is ScrollUpdateNotification &&
        scrollNotification.depth == 0) {
      double scroll = scrollNotification.metrics.pixels;
      if (scroll > appbar) {
        scale = 1;
      } else if (scroll < 0) {
        scale = 0;
      } else {
        scale = scroll / appbar;
      }
      setState(() {
        op = scale;
      });
    }
//    print(scrollNotification);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "会员充值",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: flag == false
            ? Center(
                child: Text('加载中...'),
              )
            : Container(
                decoration: BoxDecoration(color: Colors.white),
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                child: NestedScrollView(
                  headerSliverBuilder: (context, inner) {
                    return [
                      SliverToBoxAdapter(
                        child: Container(
                          child: VipTop(currentIndex: this._currentIndex),
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: StickyTabbar(VipTab(
                          currentIndex: this._currentIndex,
                          list: data,
                          onChange: onChange,
                        )),
                      )
                    ];
                  },
                  body: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      VipItem(
                          currentIndex: this._currentIndex,
                          items: this.items,
                          id: data[this._currentIndex].id),
                      VipQuestion(questions: this.questions)
                    ],
                  ),
                ),
              ));
  }
}

class StickyTabbar extends SliverPersistentHeaderDelegate {
  final VipTab child;
  StickyTabbar(this.child);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // TODO: implement build
    return this.child;
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => ScreenUtil().setWidth(450);

  @override
  // TODO: implement minExtent
  double get minExtent => ScreenUtil().setWidth(450);

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}
