import 'package:get/get.dart';
import 'download_controller.dart';

class DownloadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DownloadController>(() => DownloadController());
  }
}
