class ThemeModel {
  int id;
  String describe;
  String title;
  Null name;
  List<Item> item;

  ThemeModel({this.id, this.describe, this.title, this.name, this.item});

  ThemeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    describe = json['describe'];
    title = json['title'];
    name = json['name'];
    if (json['item'] != null) {
      item = new List<Item>();
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['describe'] = this.describe;
    data['title'] = this.title;
    data['name'] = this.name;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  int id;
  int imgId;
  int itemId;
  int themeId;
  int comboId;
  int order;
  String custom;
  String type;
  String title;
  String path;
  String describe;
  String originalPrice;
  String price;
  int precent;
  int percent;
  Img img;

  Item(
      {this.id,
      this.imgId,
      this.itemId,
      this.themeId,
      this.comboId,
      this.order,
      this.custom,
      this.type,
      this.title,
      this.path,
      this.describe,
      this.originalPrice,
      this.price,
      this.precent,
      this.percent,
      this.img});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgId = json['img_id'];
    itemId = json['item_id'];
    themeId = json['theme_id'];
    comboId = json['combo_id'];
    order = json['order'];
    custom = json['custom'];
    type = json['type'];
    title = json['title'];
    path = json['path'];
    describe = json['describe'];
    originalPrice = json['original_price'];
    price = json['price'];
    precent = json['precent'];
    percent = json['percent'];
    img = json['img'] != null ? new Img.fromJson(json['img']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_id'] = this.imgId;
    data['item_id'] = this.itemId;
    data['theme_id'] = this.themeId;
    data['combo_id'] = this.comboId;
    data['order'] = this.order;
    data['custom'] = this.custom;
    data['type'] = this.type;
    data['title'] = this.title;
    data['path'] = this.path;
    data['describe'] = this.describe;
    data['original_price'] = this.originalPrice;
    data['price'] = this.price;
    data['precent'] = this.precent;
    data['percent'] = this.percent;
    if (this.img != null) {
      data['img'] = this.img.toJson();
    }
    return data;
  }
}

class Img {
  String url;

  Img({this.url});

  Img.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
