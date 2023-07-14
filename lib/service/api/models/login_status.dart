class LoginStatus {
  int? code;
  String? message;
  int? ttl;
  Data? data;
  String? cookie;

  LoginStatus({this.code, this.message, this.ttl, this.data});

  setCookie(String cookie) {
    this.cookie = cookie;
  }

  LoginStatus.fromJson(Map<String, dynamic> json) {
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
  String? refreshToken;
  int? timestamp;
  int? code;
  String? message;

  Data({this.url, this.refreshToken, this.timestamp, this.code, this.message});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    refreshToken = json['refresh_token'];
    timestamp = json['timestamp'];
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['refresh_token'] = this.refreshToken;
    data['timestamp'] = this.timestamp;
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
