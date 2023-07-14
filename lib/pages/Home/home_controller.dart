import 'package:background_downloader/background_downloader.dart';
import 'package:get/get.dart';
import 'package:bilivideodownload/service/storage.dart';

class HomeController extends GetxController {
  final selectedIndex = 0.obs;

  StorageService storageService = Get.find();

  initDownloader() async {
    await FileDownloader().trackTasks();
    FileDownloader().configureNotification(
        running: const TaskNotification('下载中', 'file: {filename}'),
        complete: const TaskNotification('下载完成', 'file: {filename}'),
        progressBar: true);
  }

  logOut() async {
    storageService.write('cookie', '');
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  @override
  void onInit() async {
    super.onInit();
    initDownloader();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
