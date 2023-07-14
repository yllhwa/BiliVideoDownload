import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  void write(String key, dynamic value) {
    GetStorage().write(key, value);
  }

  dynamic read(String key) {
    return GetStorage().read(key);
  }

  void remove(String key) {
    GetStorage().remove(key);
  }

  void listenKey(String key, Function(dynamic) callback) {
    GetStorage().listenKey(key, callback);
  }
}
