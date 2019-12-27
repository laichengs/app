class IndexItemEntity {
	String msg;
	List<IndexItemData> data;
	int error;

	IndexItemEntity({this.msg, this.data, this.error});

	IndexItemEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		if (json['data'] != null) {
			data = new List<IndexItemData>();(json['data'] as List).forEach((v) { data.add(new IndexItemData.fromJson(v)); });
		}
		error = json['error'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['msg'] = this.msg;
		if (this.data != null) {
      data['data'] =  this.data.map((v) => v.toJson()).toList();
    }
		data['error'] = this.error;
		return data;
	}
}

class IndexItemData {
	IndexItemDataRealImg realImg;
	int classifyId;
	int titleImgId;
	String startPrice;
	int sort;
	IndexItemDataTitleImg titleImg;
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
	String step;
	int id;
	String vipPrice;
	String status;

	IndexItemData({this.realImg, this.classifyId, this.titleImgId, this.startPrice, this.sort, this.titleImg, this.discountList, this.mainImgId, this.isDiscount, this.unit, this.isCombo, this.isVideo, this.realImgId, this.price, this.isShowIndex, this.name, this.specialDiscount, this.step, this.id, this.vipPrice, this.status});

	IndexItemData.fromJson(Map<String, dynamic> json) {
		realImg = json['real_img'] != null ? new IndexItemDataRealImg.fromJson(json['real_img']) : null;
		classifyId = json['classify_id'];
		titleImgId = json['title_img_id'];
		startPrice = json['start_price'];
		sort = json['sort'];
		titleImg = json['title_img'] != null ? new IndexItemDataTitleImg.fromJson(json['title_img']) : null;
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
		step = json['step'];
		id = json['id'];
		vipPrice = json['vip_price'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.realImg != null) {
      data['real_img'] = this.realImg.toJson();
    }
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
		data['step'] = this.step;
		data['id'] = this.id;
		data['vip_price'] = this.vipPrice;
		data['status'] = this.status;
		return data;
	}
}

class IndexItemDataRealImg {
	String url;

	IndexItemDataRealImg({this.url});

	IndexItemDataRealImg.fromJson(Map<String, dynamic> json) {
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		return data;
	}
}

class IndexItemDataTitleImg {
	String url;

	IndexItemDataTitleImg({this.url});

	IndexItemDataTitleImg.fromJson(Map<String, dynamic> json) {
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		return data;
	}
}
