import 'package:get/get.dart';

import 'package:bilivideodownload/pages/Home/home_view.dart';
import 'package:bilivideodownload/pages/Home/home_binding.dart';

import 'package:bilivideodownload/pages/parse/parse_view.dart';
import 'package:bilivideodownload/pages/Parse/parse_binding.dart';

import 'package:bilivideodownload/pages/Download/download_view.dart';
import 'package:bilivideodownload/pages/Download/download_binding.dart';

import 'package:bilivideodownload/pages/User/user_view.dart';
import 'package:bilivideodownload/pages/User/user_binding.dart';

import 'package:bilivideodownload/pages/Detail/detail_view.dart';
import 'package:bilivideodownload/pages/Detail/detail_binding.dart';

abstract class Routes {
  static const home = '/';
  static const parse = '/parse';
  static const download = '/download';
  static const user = '/user';
  static const video = '/video';
  static const detail = '/detail';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.parse,
      page: () => const Parsepage(),
      binding: ParseBinding(),
    ),
    GetPage(
      name: Routes.download,
      page: () => const DownloadPage(),
      binding: DownloadBinding(),
    ),
    GetPage(
      name: Routes.user,
      page: () => const UserPage(),
      binding: UserPageBinding(),
    ),
    GetPage(
      name: Routes.detail,
      page: () => const DetailPage(),
      binding: DetailBinding(),
    ),
  ];
}
