import 'detailmodel.dart';

class KetoList {
  List<Detail> detail;
  String image;
  String subtitle;
  String title;

  KetoList({this.detail, this.image, this.subtitle, this.title});

  KetoList.fromJson(Map<String, dynamic> json) {
    if (json['detail'] != null) {
      detail = new List<Detail>();
      json['detail'].forEach((v) {
        detail.add(new Detail.fromJson(v));
      });
    }
    image = json['image'];
    subtitle = json['subtitle'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.detail != null) {
      data['detail'] = this.detail.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    return data;
  }
}
