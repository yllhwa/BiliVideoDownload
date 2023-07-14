import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:get/get.dart';

import 'video.dart';
import 'video_model.dart';
import 'user_controller.dart';

class UserPage extends GetView<UserController> {
  const UserPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 0,
        length: controller.isSelf ? 3 : 2,
        child: Scaffold(
            appBar: AppBar(
              //导航栏
              title: Obx(() => Text(controller.userName.value)),
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: Column(
              children: [
                Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      title: Obx(() => Text(controller.userName.value)),
                      leading: Obx(() => CircleAvatar(
                            backgroundImage:
                                NetworkImage(controller.userFaceUrl.value),
                          ))),
                )),
                TabBar(
                  tabs: <Widget>[
                    if (controller.isSelf)
                      const Tab(
                        text: "历史记录",
                      ),
                    const Tab(
                      text: "稿件",
                    ),
                    const Tab(
                      text: "收藏夹",
                    ),
                  ],
                ),
                Expanded(
                  // height: 300,
                  child: TabBarView(
                    children: <Widget>[
                      if (controller.isSelf)
                        Center(
                            child: PagedListView<int, VideoSummary>(
                          pagingController: controller.pagingController,
                          builderDelegate:
                              PagedChildBuilderDelegate<VideoSummary>(
                            itemBuilder: (context, item, index) =>
                                VideoListItem(
                              args: item,
                            ),
                          ),
                        )),
                      const Center(
                        child: Text("It's rainy here"),
                      ),
                      const Center(
                        child: Text("It's sunny here"),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
