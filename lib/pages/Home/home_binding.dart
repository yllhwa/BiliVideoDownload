import 'package:bilivideodownload/pages/Download/download_controller.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'package:bilivideodownload/pages/Parse/parse_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(ParseController());
    Get.put(DownloadController());
  }
}
