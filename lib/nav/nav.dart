import "package:flutter/material.dart";
import 'package:mjgj/pages/Category/category.dart';
import 'package:mjgj/pages/Home/home.dart';
import 'package:mjgj/pages/My/my.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => (runApp(Nav()));

class Nav extends StatefulWidget {
  @override
  _Nav createState() => _Nav();
}

class _Nav extends State<Nav> {
  int _currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);
  Widget build(BuildContext context) {
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true)
          ..init(context);
    return Scaffold(
        body: PageView(
          physics: new NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: _controller,
          children: <Widget>[Home(), Category(), My()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              _controller.jumpToPage(index);
            });
          },
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
            BottomNavigationBarItem(icon: Icon(Icons.apps), title: Text('分类')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('我的')),
          ],
        ));
  }
}
