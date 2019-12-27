class ItemTypeEntity {
	String msg;
	List<ItemTypeData> data;
	int error;

	ItemTypeEntity({this.msg, this.data, this.error});

	ItemTypeEntity.fromJson(Map<String, dynamic> json) {
		msg = json['msg'];
		if (json['data'] != null) {
			data = new List<ItemTypeData>();(json['data'] as List).forEach((v) { data.add(new ItemTypeData.fromJson(v)); });
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

class ItemTypeData {
	String salaryIncrementCount;
	ItemTypeDataImg img;
	int itemId;
	int salaryIncrement;
	int imgId;
	int salaryUnit;
	String title;
	int isSalary;
	String unit;
	String price;
	String salarySingleAmount;
	int id;
	int vipPrice;
	int salaryType;
	String salaryList;

	ItemTypeData({this.salaryIncrementCount, this.img, this.itemId, this.salaryIncrement, this.imgId, this.salaryUnit, this.title, this.isSalary, this.unit, this.price, this.salarySingleAmount, this.id, this.vipPrice, this.salaryType, this.salaryList});

	ItemTypeData.fromJson(Map<String, dynamic> json) {
		salaryIncrementCount = json['salary_increment_count'];
		img = json['img'] != null ? new ItemTypeDataImg.fromJson(json['img']) : null;
		itemId = json['item_id'];
		salaryIncrement = json['salary_increment'];
		imgId = json['img_id'];
		salaryUnit = json['salary_unit'];
		title = json['title'];
		isSalary = json['is_salary'];
		unit = json['unit'];
		price = json['price'];
		salarySingleAmount = json['salary_single_amount'];
		id = json['id'];
		vipPrice = json['vip_price'];
		salaryType = json['salary_type'];
		salaryList = json['salary_list'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['salary_increment_count'] = this.salaryIncrementCount;
		if (this.img != null) {
      data['img'] = this.img.toJson();
    }
		data['item_id'] = this.itemId;
		data['salary_increment'] = this.salaryIncrement;
		data['img_id'] = this.imgId;
		data['salary_unit'] = this.salaryUnit;
		data['title'] = this.title;
		data['is_salary'] = this.isSalary;
		data['unit'] = this.unit;
		data['price'] = this.price;
		data['salary_single_amount'] = this.salarySingleAmount;
		data['id'] = this.id;
		data['vip_price'] = this.vipPrice;
		data['salary_type'] = this.salaryType;
		data['salary_list'] = this.salaryList;
		return data;
	}
}

class ItemTypeDataImg {
	String url;

	ItemTypeDataImg({this.url});

	ItemTypeDataImg.fromJson(Map<String, dynamic> json) {
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = this.url;
		return data;
	}
}
