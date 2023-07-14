import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'parse_controller.dart';

class Parsepage extends GetView<ParseController> {
  const Parsepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Obx(() => Text(controller.userName.value)),
            leading: Obx(() => CircleAvatar(
                  backgroundImage: NetworkImage(controller.userFaceUrl.value),
                )),
            onTap: controller.onUserCardTap,
          ),
        )),
        Card(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '视频地址',
                ),
                controller: controller.videoidController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: controller.parseVideo,
                style: TextButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('解析'),
              ),
            ],
          ),
        )),
        Obx(() {
          if (controller.videoTitle.value != '') {
            return Card(
              child: ListTile(
                title: Text(controller.videoTitle.value),
                subtitle: Text('@${controller.videoAuthor.value}'),
              ),
            );
          } else {
            return const SizedBox();
          }
        }),
        Obx(() => Column(
              children: [
                for (var page in controller.videoPageInfos)
                  Card(
                    child: ListTile(
                      title: Text("P${page.page} ${page.pagePart}"),
                      onTap: () {
                        controller.onVideoPageCardTap(
                            controller.videoId, (page.cid ?? 0));
                      },
                    ),
                  ),
              ],
            )),
      ],
    );
  }
}
