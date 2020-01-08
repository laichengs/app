import 'package:mjgj/model/index_item_model.dart';
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
//    String result = await SpUtil.get(url);
//    if (result == null) {
    List model = await _instanse.get(url, params);
    print(model);
//    await SpUtil.save(url, json.encode(model));
    return model.map((i) {
      return IndexItemModel.fromJson(i);
    }).toList();
//    } else {
//      return IndexItemEntity.fromJson(json.decode(result));
//    }
  }
}
