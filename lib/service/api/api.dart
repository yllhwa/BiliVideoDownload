import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:bilivideodownload/service/storage.dart';
import 'models/user.dart';
import 'models/login.dart';
import 'models/login_status.dart';
import 'models/video.dart';
import 'models/user_public.dart';
import 'models/history.dart';
import 'models/video_info.dart';

class ApiService extends GetxService {
  StorageService storageService = Get.find();
  Future<ApiService> init() async {
    return this;
  }

  Future<String> getTestString(String url) async {
    return 'test String';
  }

  Future<User> GetUserData() async {
    final cookie = await storageService.read('cookie');
    if (cookie == null) {
      return User.fromJson({});
    }
    var response = await Dio().get(
      'https://api.bilibili.com/x/web-interface/nav',
      options: Options(headers: {'cookie': cookie}),
    );
    if (response.statusCode == 200) {
      return User.fromJson(response.data);
    } else {
      return User.fromJson({});
    }
  }

  Future<LoginUrl> GetLoginUrl() async {
    var response = await Dio().get(
      'https://passport.bilibili.com/x/passport-login/web/qrcode/generate',
    );
    if (response.statusCode == 200) {
      return LoginUrl.fromJson(response.data);
    } else {
      return LoginUrl.fromJson({});
    }
  }

  String mergeCookies(List<String>? setCookies) {
    if (setCookies == null) {
      return '';
    }
    var mergedCookie = '';
    for (var i = 0; i < setCookies.length; i++) {
      // 不要后面的 path 等信息，只要前面的 key=value
      mergedCookie += '${setCookies[i].split(';')[0]};';
    }
    return mergedCookie;
  }

  Future<LoginStatus> GetCookieByQrcodeKey(String qrcodeKey) async {
    var response = await Dio().get(
      'https://passport.bilibili.com/x/passport-login/web/qrcode/poll',
      queryParameters: {'qrcode_key': qrcodeKey},
    );
    if (response.statusCode == 200) {
      var loginStatus = LoginStatus.fromJson(response.data);
      // 获取 set-cookie
      var setCookies = response.headers.map['set-cookie'];
      var mergedCookie = mergeCookies(setCookies);
      loginStatus.setCookie(mergedCookie);
      return loginStatus;
    } else {
      return LoginStatus.fromJson({});
    }
  }

  Future<VideoInfo> GetVideoInfo(
    String bvId, {
    String? cookie,
  }) async {
    var response = await Dio().get(
      'https://api.bilibili.com/x/web-interface/view',
      queryParameters: {'bvid': bvId},
      options: Options(headers: {'cookie': cookie}),
    );
    if (response.statusCode == 200) {
      return VideoInfo.fromJson(response.data);
    } else {
      return VideoInfo.fromJson({});
    }
  }

  Future<UserInfoPublic> GetUserInfoPublic(int mid) async {
    final cookie = await storageService.read('cookie');
    var response = await Dio().get(
      'https://api.bilibili.com/x/web-interface/card',
      queryParameters: {'mid': mid},
      options: Options(headers: {'cookie': cookie}),
    );
    if (response.statusCode == 200) {
      return UserInfoPublic.fromJson(response.data);
    } else {
      return UserInfoPublic.fromJson({});
    }
  }

  Future<History> GetHistory(int max, int viewAt) async {
    final cookie = await storageService.read('cookie');
    var response = await Dio().get(
      'https://api.bilibili.com/x/web-interface/history/cursor',
      queryParameters: {'business': 'archive', 'max': max, 'view_at': viewAt},
      options: Options(headers: {'cookie': cookie}),
    );
    if (response.statusCode == 200) {
      return History.fromJson(response.data);
    } else {
      return History.fromJson({});
    }
  }

  Future<VideoInfoDetail> GetVideoInfoDetail(String videoId, int cid) async {
    final cookie = storageService.read('cookie');
    var response = await Dio().get(
      'https://api.bilibili.com/x/player/playurl',
      queryParameters: {
        'bvid': videoId,
        'cid': cid,
        'otype': 'json',
        'fourk': 1,
        'fnval': 4048,
      },
      options: Options(headers: {'cookie': cookie}),
    );
    if (response.statusCode == 200) {
      return VideoInfoDetail.fromJson(response.data);
    } else {
      return VideoInfoDetail.fromJson({});
    }
  }
}
