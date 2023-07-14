import 'package:background_downloader/background_downloader.dart';
import 'package:get/get.dart';
import 'package:bilivideodownload/service/storage.dart';
import 'package:bilivideodownload/utils/utils.dart';

class DownloadController extends GetxController {
  StorageService storageService = Get.find();

  final downloadList = [].obs;

  initDownloader() async {
    final records = await FileDownloader().database.allRecords();
    final localDownloadList = [];
    for (var record in records) {
      // json load
      if (record.task.metaData == '') {
        continue;
      }
      var metaData = jsonDecode(record.task.metaData) ?? {};
      if (metaData['type'] == 'audio') {
        continue;
      }
      localDownloadList
          .add({"taskId": record.task.taskId, "metaData": metaData});
    }
    downloadList.value = localDownloadList.reversed.toList();
  }

  listenDownloaderState() async {
    FileDownloader().updates.listen((update) {
      initDownloader();
    });
  }

  onDownloadCardClick(
    String taskId,
  ) async {
    await Get.toNamed('/detail', arguments: {
      "taskId": taskId,
    });
    initDownloader();
  }

  @override
  void onInit() async {
    super.onInit();
    initDownloader();
    listenDownloaderState();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
