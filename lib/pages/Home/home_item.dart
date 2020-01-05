import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/model/banner_model.dart';
import 'package:mjgj/pages/Item/Item.dart' as prefix0;
import 'package:mjgj/pages/Public/placehold_loading.dart';

class HomeItem extends StatelessWidget {
  final List itemList;
  final String title;
  HomeItem(this.title, this.itemList);
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
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
          height: ScreenUtil().setWidth(360),
          child: Swiper(
            curve: Curves.easeIn,
            itemCount: 2,
            itemBuilder: (BuildContext context, int i) {
//                return Text("123");
              return GridView.count(
                  padding:EdgeInsets.all(0),
                  physics: new NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  childAspectRatio: 5 / 4.5,
                  crossAxisSpacing: ScreenUtil().setWidth(10),
                  mainAxisSpacing: ScreenUtil().setWidth(10),
                  children: _item(context, itemList, i));
            },
          ),
        )
      ],
    );
  }

  _item(BuildContext context, List itemList, int i) {
    List<Widget> items = [];
    int start = (i) * 8;
    int end = (i + 1) * 8;
    int ci = 0;
    for (var item in itemList) {
      if (ci >= start && ci < end) {
        items.add(_singleItem(context, item));
      }
      ci++;
    }
    return items;
  }

  _singleItem(BuildContext context, data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    prefix0.Item(id: data.id, title: data.name)));
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 0),
              fadeOutDuration: Duration(milliseconds: 0),
              imageUrl: data.titleImg.url,
              width: ScreenUtil().setWidth(70),
              fit: BoxFit.fitWidth,
              placeholder: (context, url) => PlaceholderLoading(70, 70),
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
              child: Text(
                data.name,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(28),
                    color: Color(int.parse('0xff666666'))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
