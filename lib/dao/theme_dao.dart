import 'package:mjgj/model/theme_model.dart';
import 'package:mjgj/utils/net.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mjgj/utils/sp.dart';

class ThemeDao {
  var _instanse;
  ThemeDao() {
    _instanse = DioManage.getInstance();
  }
  getTheme(url, params) async {
//    String result = await SpUtil.get(url);
//    if (result == null) {
    Map<String, dynamic> model = await _instanse.get(url, params);
    await SpUtil.save(url, json.encode(model));
//    return ThemeModel.fromJson(model);
    return ThemeModel.fromJson(model);
//    } else {
//      return ThemeModel.fromJson(json.decode(result));
//    }
  }
}
