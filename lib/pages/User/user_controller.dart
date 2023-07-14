import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'video_model.dart';
import 'package:get/get.dart';
import 'package:bilivideodownload/service/storage.dart';
import 'package:bilivideodownload/service/api/api.dart';
import 'package:bilivideodownload/service/api/models/user_public.dart';
import 'package:bilivideodownload/service/api/models/history.dart';

class UserController extends GetxController {
  ApiService apiService = Get.find();
  StorageService storageService = Get.find();

  final PagingController<int, VideoSummary> pagingController =
      PagingController(firstPageKey: 0);

  var args = {};
  var isSelf = true;
  var userId = 1;

  final userName = ''.obs;
  final userFaceUrl = ''.obs;

  int max = 0;
  int viewAt = 0;

  Future<void> fetchPage(int pageKey) async {
    try {
      History history = await apiService.GetHistory(max, viewAt);
      if (history.code != 0) {
        pagingController.error = history.message;
        return;
      }
      List<VideoSummary> newItems = [];
      var historyList = history.data?.list;
      for (var item in historyList!) {
        if ((item.history?.business ?? '') != 'archive') {
          continue;
        }
        var video = VideoSummary(
          coverUrl: item.cover ?? '',
          title: item.title ?? '',
          author: item.authorName ?? '',
          videoId: item.history?.bvid ?? '',
        );
        newItems.add(video);
      }
      if (historyList.length == 20) {
        max = history.data?.cursor?.max ?? 0;
        viewAt = history.data?.cursor?.viewAt ?? 0;
        pagingController.appendPage(newItems, pageKey);
      } else {
        pagingController.appendLastPage(newItems);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void initArgs() {
    args = Get.arguments;
    isSelf = args['isSelf'];
    userId = args['userId'];
  }

  void initUserInfo() async {
    UserInfoPublic user = await apiService.GetUserInfoPublic(userId);
    userName.value = user.data?.card?.name ?? '未知';
    userFaceUrl.value = user.data?.card?.face ?? '';
  }

  void initPageController() {
    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey);
    });
  }

  @override
  void onInit() async {
    super.onInit();
    initArgs();
    initUserInfo();
    initPageController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    pagingController.dispose();
  }

  void increment() {
    update();
  }
}
