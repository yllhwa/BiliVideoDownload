import 'dart:io';
import 'package:background_downloader/background_downloader.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:bilivideodownload/utils/utils.dart';
import 'ffmpeg_desktop.dart';
import 'ffmpeg_mobile.dart';

class DetailController extends GetxController {
  late TaskRecord taskRecord;
  final metaData = {}.obs;

  var ffmpegWrapper;

  initFfmpegWrapper() {
    if (Platform.isWindows || Platform.isLinux) {
      ffmpegWrapper = FfmpegWrapperDesktop();
    } else {
      ffmpegWrapper = FfmpegWrapperMobile();
    }
  }

  getMergedVideoPath() async {
    var videoPath = await taskRecord.task.filePath();
    var outputDir = path.dirname(videoPath);
    var fileName = path.basenameWithoutExtension(videoPath);
    var outputPath = '$outputDir/merged_$fileName.mp4';
    return outputPath;
  }

  void onViewVideoTap() async {
    var outputPath = await getMergedVideoPath();
    var result = await OpenFile.open(outputPath);
    if (result.type != ResultType.done) {
      toast(result.message);
    }
  }

  void onExportVideoTap() async {
    try {
      String? downloadDirectory;
      if (Platform.isAndroid) {
        downloadDirectory = '/sdcard/Download';
      } else {
        final downloadFolder = await getDownloadsDirectory();
        if (downloadFolder != null) {
          downloadDirectory = downloadFolder.path;
        }
      }
      if (downloadDirectory == null) {
        toast("无法获取导出目录");
        return;
      }
      if (!await Permission.manageExternalStorage.request().isGranted) {
        toast("无外部存储权限");
        return;
      }
      var outputPath = await getMergedVideoPath();
      if (!await File(outputPath).exists()) {
        toast("文件不存在");
        return;
      }
      var destPath = path.join(downloadDirectory, metaData['title'] + '.mp4');
      var result = await File(outputPath).copy(destPath);
      if (result.path != '') {
        toast("导出成功，文件路径：${result.path}");
      } else {
        toast("导出失败");
      }
    } catch (e) {
      toast("导出失败${e.toString()}");
    }
  }

  void onMergeVideoAudioTap() async {
    var videoPath = await taskRecord.task.filePath();
    final records =
        await FileDownloader().database.allRecords(group: taskRecord.group);
    var audioPath = '';
    for (var record in records) {
      // json load
      if (record.task.metaData == '') {
        continue;
      }
      var metaData = jsonDecode(record.task.metaData) ?? {};
      if (metaData['type'] == 'audio') {
        audioPath = await record.task.filePath();
        break;
      }
    }
    if (audioPath == '') {
      return;
    }
    var outputPath = await getMergedVideoPath();
    var result = await ffmpegWrapper.mergeVideoAndAudio(
        videoPath, audioPath, outputPath);
    if (result) {
      toast("合并成功，文件路径：$outputPath");
    } else {
      toast("合并失败");
    }
  }

  void onDeleteVideoTap() async {
    var videoTaskId = taskRecord.task.taskId;
    var videoPath = await taskRecord.task.filePath();
    var videoFile = File(videoPath);
    if (await videoFile.exists()) {
      await videoFile.delete();
    }
    var outputPath = await getMergedVideoPath();
    var outputFile = File(outputPath);
    if (await outputFile.exists()) {
      await outputFile.delete();
    }

    var audioTaskId = '';
    final records =
        await FileDownloader().database.allRecords(group: taskRecord.group);
    for (var record in records) {
      // json load
      if (record.task.metaData == '') {
        continue;
      }
      var metaData = jsonDecode(record.task.metaData) ?? {};
      if (metaData['type'] == 'audio') {
        audioTaskId = record.task.taskId;
        break;
      }
    }
    if (audioTaskId != '') {
      var audioPath = await taskRecord.task.filePath();
      var audioFile = File(audioPath);
      if (await audioFile.exists()) {
        await audioFile.delete();
      }
    }
    await FileDownloader().database.deleteRecordWithId(videoTaskId);
    await FileDownloader().database.deleteRecordWithId(audioTaskId);
    Get.back();
  }

  @override
  void onInit() async {
    super.onInit();
    var taskId = Get.arguments['taskId'];
    taskRecord = (await FileDownloader().database.recordForId(taskId))!;
    metaData.value = jsonDecode(taskRecord.task.metaData) ?? {};
    initFfmpegWrapper();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
