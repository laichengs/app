import 'package:mjgj/model/item_entity.dart';
import 'package:mjgj/model/item_classify_entity.dart';
import 'package:mjgj/model/item_type_entity.dart';
import 'package:mjgj/model/index_item_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "ItemEntity") {
      return ItemEntity.fromJson(json) as T;
    } else if (T.toString() == "ItemClassifyEntity") {
      return ItemClassifyEntity.fromJson(json) as T;
    } else if (T.toString() == "ItemTypeEntity") {
      return ItemTypeEntity.fromJson(json) as T;
    } else if (T.toString() == "IndexItemEntity") {
      return IndexItemEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}