class ServiceModel {
  ServiceModel({
    required this.data,
    required this.message,
    required this.status,
  });
  late final List<ServiceData> data;
  late final String message;
  late final bool status;
  
  ServiceModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>ServiceData.fromJson(e)).toList();
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}

class ServiceData {
  ServiceData({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.price,
  });
  late final int id;
  late final String title;
  late final String description;
  late final String image;
  late final String category;
  late final int price;
  
  ServiceData.fromJson(Map<String, dynamic> json){
    id = json['id']??'';
    title = json['title']??'';
    description = json['description']??'';
    image = json['image']??'';
    category = json['category']??'';
    price = json['price']??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['image'] = image;
    _data['category'] = category;
    _data['price'] = price;
    return _data;
  }
}