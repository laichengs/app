class IndexItemModel {
  int id;
  String name;
  int titleImgId;
  int realImgId;
  int mainImgId;
  String price;
  String step;
  String unit;
  String vipPrice;
  String startPrice;
  String isShowIndex;
  String isDiscount;
  int sort;
  String status;
  String specialDiscount;
  int classifyId;
  int isCombo;
  String discountList;
  int isVideo;
  TitleImg titleImg;
  TitleImg realImg;

  IndexItemModel(
      {this.id,
      this.name,
      this.titleImgId,
      this.realImgId,
      this.mainImgId,
      this.price,
      this.step,
      this.unit,
      this.vipPrice,
      this.startPrice,
      this.isShowIndex,
      this.isDiscount,
      this.sort,
      this.status,
      this.specialDiscount,
      this.classifyId,
      this.isCombo,
      this.discountList,
      this.isVideo,
      this.titleImg,
      this.realImg});

  IndexItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    titleImgId = json['title_img_id'];
    realImgId = json['real_img_id'];
    mainImgId = json['main_img_id'];
    price = json['price'];
    step = json['step'];
    unit = json['unit'];
    vipPrice = json['vip_price'];
    startPrice = json['start_price'];
    isShowIndex = json['is_show_index'];
    isDiscount = json['is_discount'];
    sort = json['sort'];
    status = json['status'];
    specialDiscount = json['special_discount'];
    classifyId = json['classify_id'];
    isCombo = json['is_combo'];
    discountList = json['discount_list'];
    isVideo = json['is_video'];
    titleImg = json['title_img'] != null
        ? new TitleImg.fromJson(json['title_img'])
        : null;
    realImg = json['real_img'] != null
        ? new TitleImg.fromJson(json['real_img'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title_img_id'] = this.titleImgId;
    data['real_img_id'] = this.realImgId;
    data['main_img_id'] = this.mainImgId;
    data['price'] = this.price;
    data['step'] = this.step;
    data['unit'] = this.unit;
    data['vip_price'] = this.vipPrice;
    data['start_price'] = this.startPrice;
    data['is_show_index'] = this.isShowIndex;
    data['is_discount'] = this.isDiscount;
    data['sort'] = this.sort;
    data['status'] = this.status;
    data['special_discount'] = this.specialDiscount;
    data['classify_id'] = this.classifyId;
    data['is_combo'] = this.isCombo;
    data['discount_list'] = this.discountList;
    data['is_video'] = this.isVideo;
    if (this.titleImg != null) {
      data['title_img'] = this.titleImg.toJson();
    }
    if (this.realImg != null) {
      data['real_img'] = this.realImg.toJson();
    }
    return data;
  }
}

class TitleImg {
  String url;

  TitleImg({this.url});

  TitleImg.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
