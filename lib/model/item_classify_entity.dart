class ItemClassifyEntity {
	String msg;
	List<ItemClassifyData> data;
	int error;

	ItemClassifyEntity({this.msg, this.data, this.error});

	ItemClassifyEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		if (json['data'] != null) {
			data = new List<ItemClassifyData>();(json['data'] as List).forEach((v) { data.add(new ItemClassifyData.fromJson(v)); });
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

class ItemClassifyData {
	List<ItemClassifyDataItem> item;
	ItemClassifyDataImg img;
	int imgId;
	int id;
	String describe;
	String title;

	ItemClassifyData({this.item, this.img, this.imgId, this.id, this.describe, this.title});

	ItemClassifyData.fromJson(Map<String, dynamic> json) {
		if (json['item'] != null) {
			item = new List<ItemClassifyDataItem>();(json['item'] as List).forEach((v) { item.add(new ItemClassifyDataItem.fromJson(v)); });
		}
		img = json['img'] != null ? new ItemClassifyDataImg.fromJson(json['img']) : null;
		imgId = json['img_id'];
		id = json['id'];
		describe = json['describe'];
		title = json['title'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.item != null) {
      data['item'] =  this.item.map((v) => v.toJson()).toList();
    }
		if (this.img != null) {
      data['img'] = this.img.toJson();
    }
		data['img_id'] = this.imgId;
		data['id'] = this.id;
		data['describe'] = this.describe;
		data['title'] = this.title;
		return data;
	}
}

class ItemClassifyDataItem {
	ItemClassifyDataItemRealImg realImg;
	int classifyId;
	int titleImgId;
	String startPrice;
	int sort;
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

	ItemClassifyDataItem({this.realImg, this.classifyId, this.titleImgId, this.startPrice, this.sort, this.discountList, this.mainImgId, this.isDiscount, this.unit, this.isCombo, this.isVideo, this.realImgId, this.price, this.isShowIndex, this.name, this.specialDiscount, this.step, this.id, this.vipPrice, this.status});

	ItemClassifyDataItem.fromJson(Map<String, dynamic> json) {
		realImg = json['real_img'] != null ? new ItemClassifyDataItemRealImg.fromJson(json['real_img']) : null;
		classifyId = json['classify_id'];
		titleImgId = json['title_img_id'];
		startPrice = json['start_price'];
		sort = json['sort'];
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

class ItemClassifyDataItemRealImg {
	String url;

	ItemClassifyDataItemRealImg({this.url});

	ItemClassifyDataItemRealImg.fromJson(Map<String, dynamic> json) {
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		return data;
	}
}

class ItemClassifyDataImg {
	String url;

	ItemClassifyDataImg({this.url});

	ItemClassifyDataImg.fromJson(Map<String, dynamic> json) {
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		return data;
	}
}
