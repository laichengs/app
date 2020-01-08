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
/*    String result = await SpUtil.get(url);
    if (result == null) {*/
    Map<String, dynamic> model = await _instanse.get(url, params);
//    print(model);

    return BannerModel.fromJson(model);

//    return tmp;
//    print(jsonEncode(tmp));
//    await SpUtil.save(url, json.encode(model));
//    return BannerModel.fromJson(model);
//    } else {
//      return BannerModel.fromJson(json.decode(result));
//    }
  }
}
