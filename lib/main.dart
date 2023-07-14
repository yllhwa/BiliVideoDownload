import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:bilivideodownload/service/storage.dart';
import 'package:bilivideodownload/service/api/api.dart';
import 'package:bilivideodownload/routes/route.dart';

Future<void> initialServices() async {
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => ApiService().init());
}

Future<void> main() async {
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BiliDown',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: AppPages.pages,
      // 解决 Windows 字体显示问题
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("zh", "CN"), Locale("en", "US")],
    );
  }
}
