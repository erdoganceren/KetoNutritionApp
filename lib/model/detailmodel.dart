class Detail {
  String benefit;
  String detailImage;
  bool isFastPrep;
  bool isGlutenFree;
  bool isVegan;
  List<String> materials;
  num minPrep;
  String name;
  num netCarb;
  num protein;
  String recipe;
  num saturation;
  num serving;
  num totalCarb;
  num totalFat;

  Detail(
      {this.benefit,
      this.detailImage,
      this.isFastPrep,
      this.isGlutenFree,
      this.isVegan,
      this.materials,
      this.minPrep,
      this.name,
      this.netCarb,
      this.protein,
      this.recipe,
      this.saturation,
      this.serving,
      this.totalCarb,
      this.totalFat});

  Detail.fromJson(Map<String, dynamic> json) {
    benefit = json['benefit'];
    detailImage = json['detailImage'];
    isFastPrep = json['isFastPrep'];
    isGlutenFree = json['isGlutenFree'];
    isVegan = json['isVegan'];
    materials = json['materials'].cast<String>();
    minPrep = json['minPrep'];
    name = json['name'];
    netCarb = json['netCarb'];
    protein = json['protein'];
    recipe = json['recipe'];
    saturation = json['saturation'];
    serving = json['serving'];
    totalCarb = json['totalCarb'];
    totalFat = json['totalFat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['benefit'] = this.benefit;
    data['detailImage'] = this.detailImage;
    data['isFastPrep'] = this.isFastPrep;
    data['isGlutenFree'] = this.isGlutenFree;
    data['isVegan'] = this.isVegan;
    data['materials'] = this.materials;
    data['minPrep'] = this.minPrep;
    data['name'] = this.name;
    data['netCarb'] = this.netCarb;
    data['protein'] = this.protein;
    data['recipe'] = this.recipe;
    data['saturation'] = this.saturation;
    data['serving'] = this.serving;
    data['totalCarb'] = this.totalCarb;
    data['totalFat'] = this.totalFat;
    return data;
  }
}