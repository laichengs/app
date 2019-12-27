import 'package:mjgj/model/index_item_entity.dart';
import 'package:mjgj/utils/net.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mjgj/utils/sp.dart';

class IndexItemDao {
  var _instanse;
  IndexItemDao() {
    _instanse = DioManage.getInstance();
  }
  getIndexItem(url, params) async {
    String result = await SpUtil.get(url);
    if (result == null) {
      Map<String, dynamic> model =
          await _instanse.get(url, params, (data) {}, (error) {});
      await SpUtil.save(url, json.encode(model));
      return IndexItemEntity.fromJson(model);
    } else {
      return IndexItemEntity.fromJson(json.decode(result));
    }
  }
}
