import 'dart:convert';

class DiscountListModel {
  String name;
  String price;
  String unit;
  List<List1> list1;

  DiscountListModel({this.name, this.price, this.unit, list}) {
    this.list1 = list;
  }

  DiscountListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    unit = json['unit'];
    if (json['list'] != null) {
      list1 = new List<List1>();
      json['list'].forEach((v) {
        list1.add(new List1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['unit'] = this.unit;
    if (this.list1 != null) {
      data['list1'] = this.list1.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class List1 {
  int id;
  int price;

  List1({this.id, this.price});

  List1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    return data;
  }
}
