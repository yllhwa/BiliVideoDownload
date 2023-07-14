import 'package:get/get.dart';
import 'dart:convert';

void toast(String message) async {
  Get.rawSnackbar(
      message: message,
      animationDuration: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 1500));
}

String? jsonEncode(dynamic object) {
  try {
    return json.encode(object);
  } catch (e) {
    return null;
  }
}

Map<String, dynamic>? jsonDecode(String? source) {
  try {
    return json.decode(source ?? '');
  } catch (e) {
    return null;
  }
}
