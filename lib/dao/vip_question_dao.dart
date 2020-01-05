
import 'package:mjgj/model/question_model.dart';
import 'package:mjgj/model/recharge_amount_model.dart';
import 'package:mjgj/utils/net.dart';
import 'dart:async';
import 'dart:convert';

import 'package:mjgj/utils/sp.dart';

class VipQuestionDao {
  var _instanse;
  VipQuestionDao() {
    _instanse = DioManage.getInstance();
  }
  getQuestions(url, params) async {
    List<dynamic> model =
    await _instanse.get(url, params);
    return model.map((f){
      return QuestionModel.fromJson(f);
    }).toList();
  }
}
