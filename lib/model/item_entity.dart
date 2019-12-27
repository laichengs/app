class ItemEntity {
  String msg;
  ItemData data;
  int error;

  ItemEntity({this.msg, this.data, this.error});

  ItemEntity.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new ItemData.fromJson(json['data']) : null;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['error'] = this.error;
    return data;
  }
}

class ItemData {
  int classifyId;
  int titleImgId;
  String startPrice;
  int sort;
  ItemDataTitleImg titleImg;
  String discountList;
  int mainImgId;
  String isDiscount;
  String unit;
  int isCombo;
  int isVideo;
  int realImgId;
  String price;
  String isShowIndex;
  String name;
  String specialDiscount;
  ItemDataMainImg mainImg;
  String step;
  int id;
  String vipPrice;
  List<ItemDataDetail> detail;
  String status;

  ItemData(
      {this.classifyId,
      this.titleImgId,
      this.startPrice,
      this.sort,
      this.titleImg,
      this.discountList,
      this.mainImgId,
      this.isDiscount,
      this.unit,
      this.isCombo,
      this.isVideo,
      this.realImgId,
      this.price,
      this.isShowIndex,
      this.name,
      this.specialDiscount,
      this.mainImg,
      this.step,
      this.id,
      this.vipPrice,
      this.detail,
      this.status});

  ItemData.fromJson(Map<String, dynamic> json) {
    classifyId = json['classify_id'];
    titleImgId = json['title_img_id'];
    startPrice = json['start_price'];
    sort = json['sort'];
    titleImg = json['title_img'] != null
        ? new ItemDataTitleImg.fromJson(json['title_img'])
        : null;
    discountList = json['discount_list'];
    mainImgId = json['main_img_id'];
    isDiscount = json['is_discount'];
    unit = json['unit'];
    isCombo = json['is_combo'];
    isVideo = json['is_video'];
    realImgId = json['real_img_id'];
    price = json['price'];
    isShowIndex = json['is_show_index'];
    name = json['name'];
    specialDiscount = json['special_discount'];
    mainImg = json['main_img'] != null
        ? new ItemDataMainImg.fromJson(json['main_img'])
        : null;
    step = json['step'];
    id = json['id'];
    vipPrice = json['vip_price'];
    if (json['detail'] != null) {
      detail = new List<ItemDataDetail>();
      (json['detail'] as List).forEach((v) {
        detail.add(new ItemDataDetail.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classify_id'] = this.classifyId;
    data['title_img_id'] = this.titleImgId;
    data['start_price'] = this.startPrice;
    data['sort'] = this.sort;
    if (this.titleImg != null) {
      data['title_img'] = this.titleImg.toJson();
    }
    data['discount_list'] = this.discountList;
    data['main_img_id'] = this.mainImgId;
    data['is_discount'] = this.isDiscount;
    data['unit'] = this.unit;
    data['is_combo'] = this.isCombo;
    data['is_video'] = this.isVideo;
    data['real_img_id'] = this.realImgId;
    data['price'] = this.price;
    data['is_show_index'] = this.isShowIndex;
    data['name'] = this.name;
    data['special_discount'] = this.specialDiscount;
    if (this.mainImg != null) {
      data['main_img'] = this.mainImg.toJson();
    }
    data['step'] = this.step;
    data['id'] = this.id;
    data['vip_price'] = this.vipPrice;
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class ItemDataTitleImg {
  String url;

  ItemDataTitleImg({this.url});

  ItemDataTitleImg.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class ItemDataMainImg {
  String url;

  ItemDataMainImg({this.url});

  ItemDataMainImg.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}

class ItemDataDetail {
  ItemDataDetailImg img;
  int itemId;
  int imgId;
  int id;
  int order;

  ItemDataDetail({this.img, this.itemId, this.imgId, this.id, this.order});

  ItemDataDetail.fromJson(Map<String, dynamic> json) {
    img = json['img'] != null
        ? new ItemDataDetailImg.fromJson(json['img'])
        : null;
    itemId = json['item_id'];
    imgId = json['img_id'];
    id = json['id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.img != null) {
      data['img'] = this.img.toJson();
    }
    data['item_id'] = this.itemId;
    data['img_id'] = this.imgId;
    data['id'] = this.id;
    data['order'] = this.order;
    return data;
  }
}

class ItemDataDetailImg {
  String url;

  ItemDataDetailImg({this.url});

  ItemDataDetailImg.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
