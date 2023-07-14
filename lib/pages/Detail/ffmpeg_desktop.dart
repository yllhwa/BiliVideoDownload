import 'dart:io';
import 'ffmpeg_model.dart';

class FfmpegWrapperDesktop {
  Future<VideoCodecInfo> getVideoCodecInfo(String videoPath) async {
    return VideoCodecInfo(
      format: '',
      codec: '',
      bitRate: '',
    );
  }

  Future<bool> mergeVideoAndAudio(
      String videoPath, String audioPath, String targetPath) async {
    // call directly
    // "-i $videoPath -i $audioPath -codec copy $targetPath"
    return Process.run('ffmpeg', [
      '-i',
      videoPath,
      '-i',
      audioPath,
      '-codec',
      'copy',
      targetPath
    ]).then((ProcessResult results) {
      if (results.exitCode != 0) {
        return false;
      } else {
        return true;
      }
    });
  }
}
