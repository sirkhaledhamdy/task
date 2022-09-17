class RegisterModel {
  RegisterModel({
    required this.data,
    required this.message,
    required this.status,
  });
  late final RegisterData data;
  late final String message;
  late final bool status;
  
  RegisterModel.fromJson(Map<String, dynamic> json){
    data = RegisterData.fromJson(json['data']);
    message = json['message']??'';
    status = json['status']??'';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['status'] = status;
    return _data;
  }
}

class RegisterData {
  RegisterData({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.image,
    required this.isNotifiy,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String email;
  late final String image;
  late final bool isNotifiy;
  
  RegisterData.fromJson(Map<String, dynamic> json){
    id = json['id']??0;
    name = json['name']??'';
    phone = json['phone']??'';
    email = json['email']??'';
    image = json['image']??'';
    isNotifiy = json['is_notifiy']??false;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['image'] = image;
    _data['is_notifiy'] = isNotifiy;
    return _data;
  }
}