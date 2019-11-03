class SucculentBean{
  int id;
  String name;
  String url;

  SucculentBean();
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }

  SucculentBean.fromSql(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
}