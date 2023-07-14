import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';
import 'package:bilivideodownload/utils/utils.dart';
import 'package:bilivideodownload/pages/Parse/parse_view.dart';
import 'package:bilivideodownload/pages/Download/download_view.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const List<BottomNavigationBarItem> barItems = [
      BottomNavigationBarItem(icon: Icon(Icons.search), label: '解析'),
      BottomNavigationBarItem(icon: Icon(Icons.download), label: '下载'),
    ];

    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Obx(() =>
            Text(barItems.elementAt(controller.selectedIndex.value).label!)),
        actions: <Widget>[
          //导航栏右侧菜单
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("关于"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("使用条款"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("退出登录"),
              ),
            ];
          }, onSelected: (value) {
            if (value == 0) {
              toast("哔哩下载器");
            } else if (value == 1) {
              // TODO
            } else if (value == 2) {
              controller.logOut();
            }
          }),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: const <Widget>[Parsepage(), DownloadPage()],
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            // 底部导航
            items: barItems,
            currentIndex: controller.selectedIndex.value,
            // fixedColor: Colors.blue,
            onTap: controller.onItemTapped,
          )),
    );
  }
}
