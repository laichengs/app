import 'package:mjgj/model/banner_model.dart';
import 'package:mjgj/utils/net.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mjgj/utils/sp.dart';

class BannerDao {
  var _instanse;
  BannerDao() {
    _instanse = DioManage.getInstance();
  }
  getBanner(url, params) async {
    String result = await SpUtil.get(url);
    if (result == null) {
      Map<String, dynamic> model =
          await _instanse.get(url, params, (data) {}, (error) {});
      await SpUtil.save(url, json.encode(model));
      print("1");
      return BannerModel.fromJson(model);
    } else {
      print("2");
      return BannerModel.fromJson(json.decode(result));
    }
  }
}
