import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:background_downloader/background_downloader.dart';

import 'package:bilivideodownload/service/storage.dart';
import 'package:bilivideodownload/service/api/api.dart';
import 'package:bilivideodownload/service/api/models/user.dart';
import 'package:bilivideodownload/service/api/models/login.dart';
import 'package:bilivideodownload/service/api/models/login_status.dart';
import 'package:bilivideodownload/service/api/models/video.dart' as video;
import 'package:bilivideodownload/service/api/models/video_info.dart'
    as video_info;
import 'package:bilivideodownload/utils/utils.dart';

class ParseController extends GetxController {
  final userName = '未登录'.obs;
  final userFaceUrl = ''.obs;
  var userId = 0;

  final videoTitle = ''.obs;
  final videoAuthor = ''.obs;

  var videoCoverUrl = '';
  var videoId = '';

  var videoPageInfos = <video.Page>[].obs;

  final TextEditingController videoidController = TextEditingController();

  ApiService apiService = Get.find();
  StorageService storageService = Get.find();

  void parseVideo() async {
    if (videoidController.text == '') {
      toast('请输入视频 id');
      return;
    }
    String cookie = await storageService.read('cookie') ?? '';
    video.VideoInfo videoInfo =
        await apiService.GetVideoInfo(videoidController.text, cookie: cookie);
    if (videoInfo.code != 0) {
      toast(videoInfo.message ?? '获取视频信息失败');
      return;
    }
    videoTitle.value = videoInfo.data?.title ?? '';
    videoAuthor.value = videoInfo.data?.owner?.name ?? '';

    videoPageInfos.value = videoInfo.data?.pages ?? [];
    videoId = videoInfo.data?.bvid ?? '';
    videoCoverUrl = videoInfo.data?.pic ?? '';
    update();
  }

  void initUserInfo() async {
    User user = await apiService.GetUserData();
    userName.value = user.data?.uname ?? '未登录';
    userFaceUrl.value = user.data?.face ?? '';
    userId = user.data?.mid ?? 0;
  }

  Future<LoginUrl> getLoginUrl() async {
    LoginUrl loginUrl = await apiService.GetLoginUrl();
    return loginUrl;
  }

  Future<void> saveCookie(String qrcodeKey) async {
    LoginStatus loginStatus = await apiService.GetCookieByQrcodeKey(qrcodeKey);
    if (loginStatus.cookie != '') {
      storageService.write('cookie', loginStatus.cookie);
      initUserInfo();
    } else {
      toast('登录失败');
    }
  }

  Future<void> onUserCardTap() async {
    if (storageService.read('cookie') == null ||
        storageService.read('cookie') == '') {
      LoginUrl loginUrl = await getLoginUrl();
      Get.dialog(
        AlertDialog(
          title: const Text('扫码登录'),
          content: SizedBox(
            width: 280,
            height: 280,
            child: QrImageView(
                data: loginUrl.data?.url ?? '',
                version: QrVersions.auto,
                size: 280),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                saveCookie(loginUrl.data?.qrcodeKey ?? '');
                Get.back();
              },
              child: const Text('确定'),
            ),
          ],
        ),
        transitionDuration: const Duration(milliseconds: 150),
      );
    } else {
      var result = await Get.toNamed('/user',
          arguments: {'isSelf': true, 'userId': userId});
      if (result != null) {
        videoidController.text = result['videoId'];
        parseVideo();
      }
    }
  }

  void onVideoDownloadTap(
      video_info.VideoInfoDetail videoInfoDetail, int quality) async {
    var videoUrl = '';
    for (var dash in videoInfoDetail.data?.dash?.video ?? []) {
      if (dash.id == quality) {
        videoUrl = dash.backupUrl[0] ?? '';
        break;
      }
    }
    if (videoUrl == '') {
      toast('获取视频链接失败');
      return;
    }
    var audioUrl = '';
    for (var dash in videoInfoDetail.data?.dash?.audio ?? []) {
      if (dash.backupUrl[0] != null && dash.backupUrl[0] != '') {
        audioUrl = dash.backupUrl[0];
        break;
      }
    }
    if (audioUrl == '') {
      toast('获取音频链接失败');
      return;
    }

    var groupName = '$videoId-$quality';
    var videoMetadata = {
      'title': videoTitle.value,
      'author': videoAuthor.value,
      'videoId': videoId,
      'group': groupName,
      'type': 'video',
      'coverUrl': videoCoverUrl,
    };
    var videoMetadataString = jsonEncode(videoMetadata) ?? '';
    var cookie = await storageService.read('cookie') ?? '';
    final videoTask = await DownloadTask(
            group: groupName,
            url: videoUrl,
            headers: {
              'Cookie': cookie,
              'Referer': 'https://m.bilibili.com/',
              'User-Agent':
                  'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 EdgiOS/46.3.30 Mobile/15E148 Safari/605.1.15'
            },
            directory: 'download',
            updates: Updates
                .statusAndProgress, // request status and progress updates
            retries: 5,
            allowPause: true,
            metaData: videoMetadataString)
        .withSuggestedFilename(unique: true);
    var audioMetadata = {
      'title': videoTitle.value,
      'author': videoAuthor.value,
      'videoId': videoId,
      'group': groupName,
      'type': 'audio',
    };
    var audioMetadataJson = jsonEncode(audioMetadata) ?? '';
    final audioTask = await DownloadTask(
            group: groupName,
            url: audioUrl,
            headers: {
              'Cookie': cookie,
              'Referer': 'https://m.bilibili.com/',
              'User-Agent':
                  'Mozilla/5.0 (iPhone; CPU iPhone OS 15_0_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 EdgiOS/46.3.30 Mobile/15E148 Safari/605.1.15'
            },
            directory: 'download',
            updates: Updates
                .statusAndProgress, // request status and progress updates
            retries: 5,
            allowPause: true,
            metaData: audioMetadataJson)
        .withSuggestedFilename(unique: true);
    final successfullyEnqueuedVideo = await FileDownloader().enqueue(videoTask);
    final successfullyEnqueuedAudio = await FileDownloader().enqueue(audioTask);
    if (successfullyEnqueuedVideo && successfullyEnqueuedAudio) {
      toast('已加入下载队列');
    } else {
      toast('加入下载队列失败');
    }
  }

  void onVideoPageCardTap(String videoId, int cid) async {
    var formats = <Widget>[];
    video_info.VideoInfoDetail videoInfoDetail =
        await apiService.GetVideoInfoDetail(videoId, cid);
    if (videoInfoDetail.code != 0) {
      toast(videoInfoDetail.message ?? '获取视频信息失败');
      return;
    }
    for (var format in videoInfoDetail.data!.supportFormats!) {
      formats.add(ListTile(
          title: Text("${format.format} ${format.newDescription}"),
          onTap: () async {
            onVideoDownloadTap(videoInfoDetail, format.quality ?? 0);
            Get.back();
          }));
    }
    Get.bottomSheet(
      Wrap(children: formats),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

  void initListenCookieChange() async {
    storageService.listenKey(
        "cookie",
        (value) => {
              if (value == null || value == '')
                {userName.value = '未登录', userFaceUrl.value = '', userId = 0}
              else
                {initUserInfo()}
            });
  }

  @override
  void onInit() async {
    super.onInit();
    initUserInfo();
    initListenCookieChange();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void increment() {
    update();
  }
}
