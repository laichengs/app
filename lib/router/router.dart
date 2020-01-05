import 'package:flutter/material.dart';
import 'package:mjgj/nav/nav.dart';
import 'package:mjgj/pages/Home/home.dart';
import 'package:mjgj/pages/Item/Item.dart';
import 'package:mjgj/pages/My/my.dart';
import 'package:mjgj/pages/VipPage/vip.dart';
  final routers ={
  "/": (context)=>Nav(),
  "/my": (context)=>My(),
  "/home": (context)=>Home(),
  "/item": (context,{arguments})=>Item(id:arguments['id'],title:arguments['title']),
    "/vip":(context)=>VipPage()
};

Route onGenerateRoute(RouteSettings settings){

  final String name = settings.name;
  final Function pageContentBuilder = routers[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return MaterialPageRoute(builder: (context) => Nav());
}