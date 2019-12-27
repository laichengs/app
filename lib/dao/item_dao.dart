import 'package:mjgj/model/banner_model.dart';
import 'package:mjgj/model/item_entity.dart';
import 'package:mjgj/utils/net.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mjgj/utils/sp.dart';

class ItemDao {
  var _instanse;
  ItemDao() {
    _instanse = DioManage.getInstance();
  }
  getItem(url, params) async {
    String result = await SpUtil.get(url);

    if (result == null) {
      Map<String, dynamic> model =
          await _instanse.get(url, params, (data) {}, (error) {});
      await SpUtil.save(url, json.encode(model));
      return ItemEntity.fromJson(model);
    } else {
      return ItemEntity.fromJson(json.decode(result));
    }
  }
}
