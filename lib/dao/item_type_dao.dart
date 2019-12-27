import 'package:mjgj/model/banner_model.dart';
import 'package:mjgj/model/item_type_entity.dart';
import 'package:mjgj/utils/net.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mjgj/utils/sp.dart';

class ItemTypeDao {
  var _instanse;
  ItemTypeDao() {
    _instanse = DioManage.getInstance();
  }
  getBanner(url, params) async {
    String result = await SpUtil.get(url);
    if (result == null) {
      Map<String, dynamic> model =
          await _instanse.get(url, params, (data) {}, (error) {});
      await SpUtil.save(url, json.encode(model));
      return ItemTypeEntity.fromJson(model);
    } else {
      return ItemTypeEntity.fromJson(json.decode(result));
    }
  }
}
