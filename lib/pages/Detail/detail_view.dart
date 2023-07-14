import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: const Text("视频"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          Card(
              child: Obx(() => ListTile(
                    leading: Image.network(
                      controller.metaData['coverUrl'] ?? '',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons.error);
                      },
                    ),
                    title: Text(
                      controller.metaData['title'] ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      "@${controller.metaData['author'] ?? ''}",
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))),
          Card(
              child: ListTile(
            title: const Text("查看视频"),
            onTap: controller.onViewVideoTap,
          )),
          Card(
              child: ListTile(
                  title: const Text("导出视频"),
                  onTap: controller.onExportVideoTap)),
          Card(
              child: ListTile(
                  title: const Text("合并视频音频"),
                  onTap: controller.onMergeVideoAudioTap)),
          Card(
              child: ListTile(
            title: const Text("删除视频"),
            onTap: controller.onDeleteVideoTap,
          )),
        ],
      ),
    );
  }
}
