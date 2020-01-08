import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mjgj/dao/banner_dao.dart';
import 'package:mjgj/dao/index_item_dao.dart';
import 'package:mjgj/dao/theme_dao.dart';
import 'dart:async';
import 'package:mjgj/model/banner_model.dart';
import 'package:mjgj/model/index_item_model.dart';
import 'package:mjgj/model/theme_model.dart' as prefix0;
import 'package:mjgj/pages/Home/home_category.dart';
import 'package:mjgj/pages/Home/home_combo.dart';
import 'package:mjgj/pages/Home/home_item.dart';
import 'package:mjgj/pages/Home/home_recharge.dart';
import 'package:mjgj/pages/Home/home_recommend.dart';
import 'package:mjgj/pages/Home/home_swiper.dart';
import 'package:mjgj/pages/Public/search_box.dart';
import 'package:mjgj/utils/net.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() => (runApp(Home()));

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  List<Item> imgList;
  List<prefix0.Item> categoryList;
  List<prefix0.Item> rechargeList;
  List<prefix0.Item> comboList;
  List<prefix0.Item> recommendList;
  List<IndexItemModel> itemList;
  bool loading = true;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {}
  _getData() async {
    BannerModel bm = await new BannerDao().getBanner('/banner/7', null);
    itemList = await IndexItemDao().getIndexItem('/index_item', null);
    prefix0.ThemeModel cl = await new ThemeDao().getTheme('/theme/6', null);
    prefix0.ThemeModel rl = await new ThemeDao().getTheme('/theme/7', null);
    prefix0.ThemeModel combo = await new ThemeDao().getTheme('/theme/9', null);
    prefix0.ThemeModel recommend =
        await new ThemeDao().getTheme('/theme/8', null);
    setState(() {
      imgList = bm.item;
      itemList = itemList;
      categoryList = cl.item;
      rechargeList = rl.item;
      comboList = combo.item;
      recommendList = recommend.item;
      loading = false;
    });

    // 获取banner;
//    new BannerDao().getBanner('/api/banner/7', {"id": 6}).then((result) {
//      setState(() {
//        imgList = result.data.item;
//      });
//    });
//    //获取首页四分类;
//    new ThemeDao().getTheme('/api/theme/6', {"id": 6}).then((result) {
//      setState(() {
//        categoryList = result.data.item;
//      });
//    });
//    //获取充值类
//    new ThemeDao().getTheme('/api/theme/7', {"id": 6}).then((result) {
//      setState(() {
//        rechargeList = result.data.item;
//      });
//    });
//    //获取首页项目
//    new IndexItemDao()
//        .getIndexItem('/api/index_item', {"id": 6}).then((result) {
//      setState(() {
//        itemList = result.data;
//      });
//    });
//    //获取套餐组合
//    new ThemeDao().getTheme('/api/theme/9', {"id": 6}).then((result) {
//      setState(() {
//        comboList = result.data.item;
//      });
//    });
//    //推荐服务
//    new ThemeDao().getTheme('/api/theme/8', {"id": 6}).then((result) {
//      setState(() {
//        recommendList = result.data.item;
//      });
//    });
    _refreshController.refreshCompleted();
  }

  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
//          title: Text(
//            '首页',
//            style: TextStyle(color: Colors.black),
//          ),
//          elevation: 0,
//          brightness: Brightness.light,
//          backgroundColor: Colors.white,
//        ),
        body: this.loading == true
            ? Center(
                child: Text(
                  '加载中...',
                  style: TextStyle(color: Color(0xff999999)),
                ),
              )
            : SmartRefresher(
                enablePullDown: true,
                enablePullUp: false,
                header: WaterDropHeader(
//            complete: Text('完毕'),
                    ),
                footer: CustomFooter(
                  builder: (BuildContext context, LoadStatus mode) {
                    Widget body;
                    if (mode == LoadStatus.idle) {
                      body = Text("上拉加载");
                    } else if (mode == LoadStatus.loading) {
                      body = CupertinoActivityIndicator();
                    } else if (mode == LoadStatus.failed) {
                      body = Text("加载失败！点击重试！");
                    } else if (mode == LoadStatus.canLoading) {
                      body = Text("松手,加载更多!");
                    } else {
                      body = Text("没有更多数据了!");
                    }
                    return Container(
                      height: 55.0,
                      child: Center(child: body),
                    );
                  },
                ),
                controller: _refreshController,
                onRefresh: _getData,
                onLoading: _getData,
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    SearchBox('空调清洗', true),
                    HomeSwiper(imgList),
                    HomeCategory(categoryList),
                    HomeRecharge('热销组合', rechargeList),
                    HomeItem('居家必选', itemList), //
                    HomeCombo('特价套餐', comboList),
                    HomeRecommend('推荐服务', recommendList),
                  ],
                ),
              ));
  }
}
