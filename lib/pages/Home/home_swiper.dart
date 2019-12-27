import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mjgj/pages/Public/placehold_loading.dart';

class HomeSwiper extends StatelessWidget {
  final List imgList;
  HomeSwiper(this.imgList);
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(top: 10),
        height: ScreenUtil().setHeight(220),
        child: Swiper(
          onTap: (index) {
            print(index);
          },
          curve: Curves.easeIn,
          autoplay: true,
          itemCount: imgList.length,
          viewportFraction: 0.85,
          scale: 0.9,
          itemBuilder: (BuildContext context, int i) {
            return new ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: CachedNetworkImage(
                  imageUrl: imgList[i].img.url,
                  placeholder: (context, url) => PlaceholderLoading(220, 220),
                ));
          },
        ));
  }
}
