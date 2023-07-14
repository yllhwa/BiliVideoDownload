import 'package:flutter/material.dart';
import 'video_model.dart';
import 'package:get/get.dart';

/// List item representing a single Video with its photo and name.
class VideoListItem extends StatelessWidget {
  const VideoListItem({
    required this.args,
    Key? key,
  }) : super(key: key);

  final VideoSummary args;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: Image.network(args.coverUrl,
              width: 100, height: 100, fit: BoxFit.cover),
          title: Text(args.title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  )),
          subtitle: Text('@${args.author}'),
          onTap: () {
            Get.back(result: {
              'videoId': args.videoId,
            });
          },
          // isThreeLine: true,
          // dense: true,
        ),
      );
}
