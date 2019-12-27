import 'package:mjgj/model/item_classify_entity.dart';
import 'package:mjgj/utils/net.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mjgj/utils/sp.dart';

class ItemClassifyDao {
  var _instanse;
  ItemClassifyDao() {
    _instanse = DioManage.getInstance();
  }
  getItemClassify(url, params) async {
    String result = await SpUtil.get(url);
    if (result == null) {
      Map<String, dynamic> model =
          await _instanse.get(url, params, (data) {}, (error) {});
      await SpUtil.save(url, json.encode(model));
      return ItemClassifyEntity.fromJson(model);
    } else {
      return ItemClassifyEntity.fromJson(json.decode(result));
    }
  }
}
