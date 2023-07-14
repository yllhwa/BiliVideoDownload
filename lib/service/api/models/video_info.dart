class VideoInfoDetail {
  int? code;
  String? message;
  int? ttl;
  Data? data;

  VideoInfoDetail({
    this.code,
    this.message,
    this.ttl,
    this.data,
  });

  factory VideoInfoDetail.fromJson(Map<String, dynamic> json) =>
      VideoInfoDetail(
        code: json["code"],
        message: json["message"],
        ttl: json["ttl"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "ttl": ttl,
        "data": data?.toJson(),
      };
}

class Data {
  String? from;
  String? result;
  String? message;
  int? quality;
  String? format;
  int? timelength;
  String? acceptFormat;
  List<String>? acceptDescription;
  List<int>? acceptQuality;
  int? videoCodecid;
  String? seekParam;
  String? seekType;
  Dash? dash;
  List<SupportFormat>? supportFormats;
  dynamic highFormat;
  int? lastPlayTime;
  int? lastPlayCid;

  Data({
    this.from,
    this.result,
    this.message,
    this.quality,
    this.format,
    this.timelength,
    this.acceptFormat,
    this.acceptDescription,
    this.acceptQuality,
    this.videoCodecid,
    this.seekParam,
    this.seekType,
    this.dash,
    this.supportFormats,
    this.highFormat,
    this.lastPlayTime,
    this.lastPlayCid,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        from: json["from"],
        result: json["result"],
        message: json["message"],
        quality: json["quality"],
        format: json["format"],
        timelength: json["timelength"],
        acceptFormat: json["accept_format"],
        acceptDescription: json["accept_description"] == null
            ? []
            : List<String>.from(json["accept_description"]!.map((x) => x)),
        acceptQuality: json["accept_quality"] == null
            ? []
            : List<int>.from(json["accept_quality"]!.map((x) => x)),
        videoCodecid: json["video_codecid"],
        seekParam: json["seek_param"],
        seekType: json["seek_type"],
        dash: json["dash"] == null ? null : Dash.fromJson(json["dash"]),
        supportFormats: json["support_formats"] == null
            ? []
            : List<SupportFormat>.from(
                json["support_formats"]!.map((x) => SupportFormat.fromJson(x))),
        highFormat: json["high_format"],
        lastPlayTime: json["last_play_time"],
        lastPlayCid: json["last_play_cid"],
      );

  Map<String, dynamic> toJson() => {
        "from": from,
        "result": result,
        "message": message,
        "quality": quality,
        "format": format,
        "timelength": timelength,
        "accept_format": acceptFormat,
        "accept_description": acceptDescription == null
            ? []
            : List<dynamic>.from(acceptDescription!.map((x) => x)),
        "accept_quality": acceptQuality == null
            ? []
            : List<dynamic>.from(acceptQuality!.map((x) => x)),
        "video_codecid": videoCodecid,
        "seek_param": seekParam,
        "seek_type": seekType,
        "dash": dash?.toJson(),
        "support_formats": supportFormats == null
            ? []
            : List<dynamic>.from(supportFormats!.map((x) => x.toJson())),
        "high_format": highFormat,
        "last_play_time": lastPlayTime,
        "last_play_cid": lastPlayCid,
      };
}

class Dash {
  int? duration;
  double? minBufferTime;
  double? dashMinBufferTime;
  List<Audio>? video;
  List<Audio>? audio;
  Dolby? dolby;
  dynamic flac;

  Dash({
    this.duration,
    this.minBufferTime,
    this.dashMinBufferTime,
    this.video,
    this.audio,
    this.dolby,
    this.flac,
  });

  factory Dash.fromJson(Map<String, dynamic> json) => Dash(
        duration: json["duration"],
        minBufferTime: json["minBufferTime"]?.toDouble(),
        dashMinBufferTime: json["min_buffer_time"]?.toDouble(),
        video: json["video"] == null
            ? []
            : List<Audio>.from(json["video"]!.map((x) => Audio.fromJson(x))),
        audio: json["audio"] == null
            ? []
            : List<Audio>.from(json["audio"]!.map((x) => Audio.fromJson(x))),
        dolby: json["dolby"] == null ? null : Dolby.fromJson(json["dolby"]),
        flac: json["flac"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "minBufferTime": minBufferTime,
        "min_buffer_time": dashMinBufferTime,
        "video": video == null
            ? []
            : List<dynamic>.from(video!.map((x) => x.toJson())),
        "audio": audio == null
            ? []
            : List<dynamic>.from(audio!.map((x) => x.toJson())),
        "dolby": dolby?.toJson(),
        "flac": flac,
      };
}

class Audio {
  int? id;
  String? baseUrl;
  String? audioBaseUrl;
  List<String>? backupUrl;
  List<String>? audioBackupUrl;
  int? bandwidth;
  String? mimeType;
  String? audioMimeType;
  String? codecs;
  int? width;
  int? height;
  String? frameRate;
  String? audioFrameRate;
  String? sar;
  int? startWithSap;
  int? audioStartWithSap;
  SegmentBase? segmentBase;
  SegmentBaseClass? audioSegmentBase;
  int? codecid;

  Audio({
    this.id,
    this.baseUrl,
    this.audioBaseUrl,
    this.backupUrl,
    this.audioBackupUrl,
    this.bandwidth,
    this.mimeType,
    this.audioMimeType,
    this.codecs,
    this.width,
    this.height,
    this.frameRate,
    this.audioFrameRate,
    this.sar,
    this.startWithSap,
    this.audioStartWithSap,
    this.segmentBase,
    this.audioSegmentBase,
    this.codecid,
  });

  factory Audio.fromJson(Map<String, dynamic> json) => Audio(
        id: json["id"],
        baseUrl: json["baseUrl"],
        audioBaseUrl: json["base_url"],
        backupUrl: json["backupUrl"] == null
            ? []
            : List<String>.from(json["backupUrl"]!.map((x) => x)),
        audioBackupUrl: json["backup_url"] == null
            ? []
            : List<String>.from(json["backup_url"]!.map((x) => x)),
        bandwidth: json["bandwidth"],
        mimeType: json["mimeType"],
        audioMimeType: json["mime_type"],
        codecs: json["codecs"],
        width: json["width"],
        height: json["height"],
        frameRate: json["frameRate"],
        audioFrameRate: json["frame_rate"],
        sar: json["sar"],
        startWithSap: json["startWithSap"],
        audioStartWithSap: json["start_with_sap"],
        segmentBase: json["SegmentBase"] == null
            ? null
            : SegmentBase.fromJson(json["SegmentBase"]),
        audioSegmentBase: json["segment_base"] == null
            ? null
            : SegmentBaseClass.fromJson(json["segment_base"]),
        codecid: json["codecid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "baseUrl": baseUrl,
        "base_url": audioBaseUrl,
        "backupUrl": backupUrl == null
            ? []
            : List<dynamic>.from(backupUrl!.map((x) => x)),
        "backup_url": audioBackupUrl == null
            ? []
            : List<dynamic>.from(audioBackupUrl!.map((x) => x)),
        "bandwidth": bandwidth,
        "mimeType": mimeType,
        "mime_type": audioMimeType,
        "codecs": codecs,
        "width": width,
        "height": height,
        "frameRate": frameRate,
        "frame_rate": audioFrameRate,
        "sar": sar,
        "startWithSap": startWithSap,
        "start_with_sap": audioStartWithSap,
        "SegmentBase": segmentBase?.toJson(),
        "segment_base": audioSegmentBase?.toJson(),
        "codecid": codecid,
      };
}

class SegmentBaseClass {
  String? initialization;
  String? indexRange;

  SegmentBaseClass({
    this.initialization,
    this.indexRange,
  });

  factory SegmentBaseClass.fromJson(Map<String, dynamic> json) =>
      SegmentBaseClass(
        initialization: json["initialization"],
        indexRange: json["index_range"],
      );

  Map<String, dynamic> toJson() => {
        "initialization": initialization,
        "index_range": indexRange,
      };
}

class SegmentBase {
  String? initialization;
  String? indexRange;

  SegmentBase({
    this.initialization,
    this.indexRange,
  });

  factory SegmentBase.fromJson(Map<String, dynamic> json) => SegmentBase(
        initialization: json["Initialization"],
        indexRange: json["indexRange"],
      );

  Map<String, dynamic> toJson() => {
        "Initialization": initialization,
        "indexRange": indexRange,
      };
}

class Dolby {
  int? type;
  dynamic audio;

  Dolby({
    this.type,
    this.audio,
  });

  factory Dolby.fromJson(Map<String, dynamic> json) => Dolby(
        type: json["type"],
        audio: json["audio"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "audio": audio,
      };
}

class SupportFormat {
  int? quality;
  String? format;
  String? newDescription;
  String? displayDesc;
  String? superscript;
  List<String>? codecs;

  SupportFormat({
    this.quality,
    this.format,
    this.newDescription,
    this.displayDesc,
    this.superscript,
    this.codecs,
  });

  factory SupportFormat.fromJson(Map<String, dynamic> json) => SupportFormat(
        quality: json["quality"],
        format: json["format"],
        newDescription: json["new_description"],
        displayDesc: json["display_desc"],
        superscript: json["superscript"],
        codecs: json["codecs"] == null
            ? []
            : List<String>.from(json["codecs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "quality": quality,
        "format": format,
        "new_description": newDescription,
        "display_desc": displayDesc,
        "superscript": superscript,
        "codecs":
            codecs == null ? [] : List<dynamic>.from(codecs!.map((x) => x)),
      };
}
