import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffprobe_kit.dart';
import 'package:ffmpeg_kit_flutter/session_state.dart';

import 'ffmpeg_model.dart';

class FfmpegWrapperMobile {
  Future<VideoCodecInfo> getVideoCodecInfo(String videoPath) async {
    return FFprobeKit.getMediaInformation(videoPath).then((session) async {
      var mediaInformation = session.getMediaInformation();
      if (mediaInformation == null) {
        throw Exception('MediaInformation is null');
      }
      var format = mediaInformation.getFormat();
      var codec = mediaInformation.getStreams().first.getCodec();
      var bitRate = mediaInformation.getBitrate();
      return VideoCodecInfo(
        format: format ?? "",
        codec: codec ?? "",
        bitRate: bitRate ?? "",
      );
    });
  }

  Future<bool> mergeVideoAndAudio(
      String videoPath, String audioPath, String targetPath) {
    return FFmpegKit.executeAsync(
      "-i $videoPath -i $audioPath -codec copy $targetPath",
    ).then((session) async {
      if ((await session.getState()) == SessionState.failed) {
        return false;
      }
      return true;
    });
  }
}
