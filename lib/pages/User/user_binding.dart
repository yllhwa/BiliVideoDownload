import 'package:get/get.dart';
import 'user_controller.dart';

class UserPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController());
  }
}
