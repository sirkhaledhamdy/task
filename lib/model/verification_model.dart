class VerificationModel {
  VerificationModel({
    required this.data,
    required this.message,
    required this.status,
  });
  late final Data data;
  late final String message;
  late final bool status;
  
  VerificationModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
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

class Data {
  Data({
    required this.code,
  });
  late final int code;
  
  Data.fromJson(Map<String, dynamic> json){
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    return _data;
  }
}