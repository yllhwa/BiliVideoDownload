import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'download_controller.dart';

class DownloadPage extends GetView<DownloadController> {
  const DownloadPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          children: [
            for (var data in controller.downloadList)
              Card(
                  child: ListTile(
                title: Text(
                  data['metaData']['title'],
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "@${data['metaData']['author']}",
                  overflow: TextOverflow.ellipsis,
                ),
                leading: Image.network(
                  data['metaData']['coverUrl'] ?? '',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
                onTap: () {
                  controller.onDownloadCardClick(data['taskId']);
                },
              ))
          ],
        ));
  }
}
