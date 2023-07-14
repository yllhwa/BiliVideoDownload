import 'package:get/get.dart';
import 'parse_controller.dart';

class ParseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParseController>(() => ParseController());
  }
}
