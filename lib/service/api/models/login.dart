class LoginUrl {
  int? code;
  String? message;
  int? ttl;
  Data? data;

  LoginUrl({this.code, this.message, this.ttl, this.data});

  LoginUrl.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    ttl = json['ttl'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['ttl'] = this.ttl;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? url;
  String? qrcodeKey;

  Data({this.url, this.qrcodeKey});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    qrcodeKey = json['qrcode_key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['qrcode_key'] = this.qrcodeKey;
    return data;
  }
}
