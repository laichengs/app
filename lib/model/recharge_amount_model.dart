class RechargeAmountModel {
	int id;
	String amount;
	String discount;
	String discountNum;
	String specialNum;
	String level;
	String name;
	String present;
	int presentCount;

	RechargeAmountModel(
			{this.id,
				this.amount,
				this.discount,
				this.discountNum,
				this.specialNum,
				this.level,
				this.name,
				this.present,
				this.presentCount});

	RechargeAmountModel.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		amount = json['amount'];
		discount = json['discount'];
		discountNum = json['discount_num'];
		specialNum = json['special_num'];
		level = json['level'];
		name = json['name'];
		present = json['present'];
		presentCount = json['present_count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['amount'] = this.amount;
		data['discount'] = this.discount;
		data['discount_num'] = this.discountNum;
		data['special_num'] = this.specialNum;
		data['level'] = this.level;
		data['name'] = this.name;
		data['present'] = this.present;
		data['present_count'] = this.presentCount;
		return data;
	}
}
