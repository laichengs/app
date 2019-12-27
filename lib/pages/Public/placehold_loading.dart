import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlaceholderLoading extends StatelessWidget {
  final int width;
  final int height;
  PlaceholderLoading(this.width, this.height);
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(width),
      height: ScreenUtil().setWidth(height),
      decoration: BoxDecoration(color: Color(0xffeeeeee)),
    );
  }
}
