class BannerModel {
  int error;
  Data data;
  String msg;

  BannerModel({this.error, this.data, this.msg});

  BannerModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['msg'] = this.msg;
    return data;
  }
}

class Data {
  int id;
  String title;
  String describe;
  Null describeName;
  List<Item> item;

  Data({this.id, this.title, this.describe, this.describeName, this.item});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    describe = json['describe'];
    describeName = json['describe_name'];
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
    data['title'] = this.title;
    data['describe'] = this.describe;
    data['describe_name'] = this.describeName;
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  int id;
  int imgId;
  Null itemId;
  Null type;
  int bannerId;
  String createTime;
  String updateTime;
  String title;
  String path;
  Null deleteTime;
  Img img;

  Item(
      {this.id,
      this.imgId,
      this.itemId,
      this.type,
      this.bannerId,
      this.createTime,
      this.updateTime,
      this.title,
      this.path,
      this.deleteTime,
      this.img});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgId = json['img_id'];
    itemId = json['item_id'];
    type = json['type'];
    bannerId = json['banner_id'];
    createTime = json['create_time'];
    updateTime = json['update_time'];
    title = json['title'];
    path = json['path'];
    deleteTime = json['delete_time'];
    img = json['img'] != null ? new Img.fromJson(json['img']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_id'] = this.imgId;
    data['item_id'] = this.itemId;
    data['type'] = this.type;
    data['banner_id'] = this.bannerId;
    data['create_time'] = this.createTime;
    data['update_time'] = this.updateTime;
    data['title'] = this.title;
    data['path'] = this.path;
    data['delete_time'] = this.deleteTime;
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
