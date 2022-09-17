class SuccessModel {
    SuccessModel({
      required this.data,
      required this.message,
      required this.status,
    });
    late final SuccessData data;
    late final String message;
    late final bool status;
    
    SuccessModel.fromJson(Map<String, dynamic> json){
      data = SuccessData.fromJson(json['data']);
      message = json['message'];
      status = json['status'];
    }
  
    Map<String, dynamic> toJson() {
      final _data = <String, dynamic>{};
      _data['data'] = data.toJson();
      _data['message'] = message;
      _data['status'] = status;
      return _data;
    }
  }
  
  class SuccessData {
    SuccessData({
      required this.user,
      required this.token,
    });
    late final User user;
    late final String token;
    
    SuccessData.fromJson(Map<String, dynamic> json){
      user = User.fromJson(json['user']);
      token = json['token'];
    }
  
    Map<String, dynamic> toJson() {
      final _data = <String, dynamic>{};
      _data['user'] = user.toJson();
      _data['token'] = token;
      return _data;
    }
  }
  
  class User {
    User({
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
    
    User.fromJson(Map<String, dynamic> json){
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